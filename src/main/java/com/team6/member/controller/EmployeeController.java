package com.team6.member.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.client.http.HttpStatusCodes;
import com.team6.member.model.EmployeeAccountBean;
import com.team6.member.model.EmployeeService;
import com.team6.member.model.MemberAccountBean;
import com.team6.member.model.MemberDetailBean;
import com.team6.member.model.MemberService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.ParseException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	private EmployeeService eService;
	@Autowired
	private MemberService mService;

	// 登入系列
	@RequestMapping(path = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String EmpMain(SessionStatus status, HttpSession session) {
		status.isComplete();
		session.removeAttribute("emp");
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	@RequestMapping(path = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String EmpOutMain(SessionStatus status, HttpSession session) {
		status.isComplete();
		session.removeAttribute("emp");
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	@PostMapping("/emplogin.controller")
	public String login(@RequestParam("account") String account, @RequestParam("password") String pwd, Model model,
			HttpSession session) {
		EmployeeAccountBean bean = eService.login(account, pwd);
		if (bean != null) {
			if (bean.getEmpPermissions() == "0") {
				model.addAttribute("err", "此帳號已無權限!!");
				return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
			} else {
				session.setAttribute("emp", bean);
				return "forward:/WEB-INF/back-jsp/EmpIndex.jsp";
			}

		}
		model.addAttribute("err", "帳號或密碼不正確!!");
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}
	// ===================================================================================================

	// 後台從會員功能返回主頁
	@RequestMapping(path = "/EmpGoBackToEmpIndex", method = { RequestMethod.GET, RequestMethod.POST })
	public String EmpGoBackToEmpIndex(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			HttpSession session) {
		if (bean != null) {
			session.setAttribute("emp", bean);
			return "forward:/WEB-INF/back-jsp/EmpIndex.jsp";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}
	// ===================================================================================================

	// 查詢系列--單筆
	@GetMapping("/Member.SelectOneByID")
	public ResponseEntity<MemberAccountBean> SelectByOne(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean accountBean,
			@RequestParam("id") int id, Model model) {
		if (accountBean != null) {
			MemberAccountBean bean = mService.findById(id);
			return ResponseEntity.ok(bean);
		}
		return null;
	}

	@GetMapping("/Member.SelectOneByAccount")
	public String SelectByOne(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean accountBean,
			@RequestParam("account") String account, Model model) {
		if (accountBean != null) {
			MemberAccountBean bean = mService.findAccountByAccount(account);
			model.addAttribute("bean", bean);
			return "forward:/WEB-INF/back-jsp/member/MemberGetOne.jsp";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}
	// ===================================================================================================

	// 查詢系列--模糊
	@RequestMapping(path = "/MemberSelectByName", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity<List<MemberAccountBean>> processQueryByNameByPage(
			@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@RequestParam("mName")String name, HttpServletRequest request) {
		if (bean != null) {
			HttpSession session = request.getSession();
			List<MemberAccountBean> beans = mService.findByName(name);
			session.setAttribute("emp", bean);
			return ResponseEntity.ok(beans);
		}
		return null;
	}
	
	// 查詢系列--模糊 (未被假刪除)
	@GetMapping("/Member.SelectByNameAndNotHidden")
	@ResponseBody
	public ResponseEntity<List<MemberAccountBean>> SelectByNameAndNotHidden(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@RequestParam("mName") String mName, Model model, HttpSession session) {
		if (bean != null) {
			List<MemberAccountBean> beans = mService.findByNameAndNotHidden(mName);
			session.setAttribute("emp", bean);
			return ResponseEntity.ok(beans);
		}
		return null;
	}
	
	// ===================================================================================================

	// 查詢系列--全部(假刪除以外)
	@RequestMapping(path = "/Member.SelectAllByNotHidden/{pageNo}", method = { RequestMethod.GET, RequestMethod.POST,
			RequestMethod.PUT, RequestMethod.DELETE })
	public String SelectAllByNotHidden(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@PathVariable("pageNo") int pageNo, Model model, HttpSession session) {
		if (bean != null) {
			int pageSize = 10;
			if (pageNo <= 0) {
				pageNo = 1;
			}
			Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
			Page<MemberAccountBean> page = mService.findAllByNotHiddenByPage(pageable);
			int totalPages = page.getTotalPages();
			long totalElements = page.getTotalElements();
			if (totalElements == 0) {
				model.addAttribute("err", "查無資料");
				model.addAttribute("totalElements", totalElements);
				return "forward:/WEB-INF/back-jsp/member/EmpHiddenMemberGetAll.jsp";
			}
			model.addAttribute("totalPages", totalPages);
			model.addAttribute("totalElements", totalElements);
			model.addAttribute(page.getContent());

			session.setAttribute("emp", bean);

			return "forward:/WEB-INF/back-jsp/member/EmpHiddenMemberGetAll.jsp";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	@RequestMapping(path = "/MemberGetAllByNotHidden/{pageNo}", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<MemberAccountBean> processQueryAllByNotHiddenByPage(
			@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@PathVariable("pageNo") int pageNo, Model m, HttpServletRequest request) {
		if (bean != null) {
			int pageSize = 10;
			Pageable p1 = PageRequest.of(pageNo - 1, pageSize);
			Page<MemberAccountBean> page = mService.findAllByNotHiddenByPage(p1);

			int totalPages = page.getTotalPages();
			long totalElements = page.getTotalElements();

			HttpSession session = request.getSession();
			session.setAttribute("emp", bean);
			session.setAttribute("totalPages", totalPages);
			session.setAttribute("totalElements", totalElements);

			return page.getContent();
		}
		return null;
	}

	// 查詢系列--全部
	@RequestMapping(path = "/Member.SelectAll/{pageNo}", method = { RequestMethod.GET, RequestMethod.POST,
			RequestMethod.PUT, RequestMethod.DELETE })
	public String GetAllByPage(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@PathVariable("pageNo") int pageNo, Model m, HttpSession session) {
		if (bean != null) {
			int pageSize = 10;
			if (pageNo <= 0) {
				pageNo = 1;
			}
			Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
			Page<MemberAccountBean> page = mService.findAllByPage(pageable);
			int totalPages = page.getTotalPages();
			long totalElements = page.getTotalElements();

			session.setAttribute("emp", bean);

			m.addAttribute("totalPages", totalPages);
			m.addAttribute("totalElements", totalElements);
			m.addAttribute(page.getContent());
			return "forward:/WEB-INF/back-jsp/member/EmpMemberGetAll.jsp";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	@RequestMapping(path = "/MemberGetAll/{pageNo}", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<MemberAccountBean> processQueryAllByPage(
			@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@PathVariable("pageNo") int pageNo, Model m, HttpServletRequest request) {
		if (bean != null) {
			int pageSize = 10;
			Pageable p1 = PageRequest.of(pageNo - 1, pageSize);
			Page<MemberAccountBean> page = mService.findAllByPage(p1);

			int totalPages = page.getTotalPages();
			long totalElements = page.getTotalElements();

			HttpSession session = request.getSession();
			session.setAttribute("emp", bean);
			session.setAttribute("totalPages", totalPages);
			session.setAttribute("totalElements", totalElements);

			return page.getContent();
		}
		return null;
	}
	// ===================================================================================================
	@PostMapping("/Member.Insert")
	public ResponseEntity<MemberAccountBean> Insert(@RequestParam("account") String mAccount, @RequestParam("password") String mPassword,
			@RequestParam("mEmail") String mEmail, Model model, HttpSession session) throws MessagingException {
//		DateTimeFormatter formatter= DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		bean.setBirthday(LocalDate.parse(birthday,formatter));
		Optional<MemberAccountBean> optional = mService.findAccountByEmail(mEmail);
		if (optional.isEmpty()) {
			LocalDate nowDate = LocalDate.now();
			MemberAccountBean bean = new MemberAccountBean();
			bean.setmAccount(mAccount);
			bean.setmPassword(mPassword);
			bean.setPermissions(1);
			bean.setHidden(1);
			MemberAccountBean returnBean = mService.insertAccount(bean);
			MemberDetailBean detailBean = new MemberDetailBean();
			detailBean.setBean(returnBean);
			detailBean.setmName(returnBean.getmAccount());
			detailBean.setmEmail(mEmail);
			detailBean.setmPhone("");
			detailBean.setmPhoto("/images/member/user.png");
			detailBean.setMbirthday(nowDate);
			detailBean.setRegistrationDate(nowDate);
			returnBean.setDetailBean(detailBean);
			MemberAccountBean result = mService.insertDetail(returnBean);

			session.setAttribute("member", result);
			// 加自動寄信 ok
			String receivers = detailBean.getmEmail();
			String subject = "成為會員通知信";
			String content = mailContent(detailBean.getmName(), "感謝您成為 DonerPizza 的會員。");
			String from = "DonerPizza<h60915@gmail.com>";
			mService.sendPlainText(receivers, subject, content, from);
			// -------------------------------------------------------
			return ResponseEntity.ok(result);
		}
		model.addAttribute("err", "此信箱已被註冊。");
		return null;
	}
	
	// ===================================================================================================

	// 更新會員細項 ok
		@PostMapping("/Member.UpdateDetail")
		public ResponseEntity<MemberAccountBean> UpdateDetail(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean accountBean,
				@RequestParam("maid") int maid, 
				@RequestParam("account") String mAccount, 
				@RequestParam("mName") String mName,
				@RequestParam("password") String password,
				@RequestParam("mEmail") String mEmail,
				@RequestParam("mPhone") String mPhone,
				@RequestParam("mbirthday") String mbirthday,
				@RequestParam(value = "mPhoto", required = false) MultipartFile mf, Model model, HttpSession session)
				throws ParseException, IllegalStateException, IOException {
			if (accountBean != null) {
				System.out.println("updateMemberDetail  1");
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				MemberAccountBean bean = mService.findById(maid);
				MemberAccountBean oldbean = mService.findById(maid);
				String mPhoto = "";
				if (mf != null && !mf.isEmpty()) {
					System.out.println("updateMemberDetail  2");
					String fileName = mf.getOriginalFilename();
					String fileDir = "C:/Users/User/Documents/team6/team6/src/main/resources/static/images/member/users";
					File fileDirPath = new File(fileDir, fileName);
					mf.transferTo(fileDirPath);
					mPhoto = "/images/member/users/" + fileName;
					
					bean.setmPassword(password);
					mService.insertAccount(bean);
					System.out.println("updateMemberDetail  3");
					MemberAccountBean resultBean = mService.updateDetail(bean, mName, mEmail, mPhone, mPhoto,
							LocalDate.parse(mbirthday, formatter));
					return ResponseEntity.ok(resultBean);
				} else {
					System.out.println("updateMemberDetail  4");
					mPhoto = oldbean.getDetailBean().getmPhoto();
					bean.setmPassword(password);
					mService.insertAccount(bean);
					MemberAccountBean resultBean = mService.updateDetail(bean, mName, mEmail, mPhone, mPhoto,
							LocalDate.parse(mbirthday, formatter));
					System.out.println("updateMemberDetail  5");
					return ResponseEntity.ok(resultBean);
				}
			}
			return ResponseEntity.status(HttpStatusCodes.STATUS_CODE_FOUND).build();
		}
	
	// 更新權限
	@PutMapping("/Member.UpdatePermissions")
	@ResponseBody
	public String UpdatePermissions(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@RequestParam("account") String account, @RequestParam("permissions") int permissions,
			@RequestParam("empPermissions") int empPermissions, Model model) {
		if (bean != null) {
			boolean result = mService.updateToPermissions(account, permissions);
			if (result) {
				return "redirect:Member.SelectAll/1";
			}
			model.addAttribute("err", "更新失敗");
			return "forward:/WEB-INF/back-jsp/EmpIndex.jsp";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// ===================================================================================================
	// 假刪除 ok
	@DeleteMapping("/Member.Delete")
	@ResponseBody
	public String Delete(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@RequestParam("account") String account) {
		if (bean != null) {
			mService.delete(account);
			return "redirect:Member.SelectAll/1";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	@PutMapping("/Member.Reback")
	@ResponseBody
	public String Reback(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean,
			@RequestParam("account") String account) {
		if (bean != null) {
			mService.Reback(account);
			return "redirect:Member.SelectAll/1";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";
	}

	// ===================================================================================================
	// 存檔會員資料表
	@GetMapping("/Member.Save")
	public String Save(@SessionAttribute(value = "emp", required = false) EmployeeAccountBean bean, @RequestParam("type")String type) {
		if (bean != null) {
			switch (type) {
			case "csv": {
				mService.saveAccountToCSV();
				mService.saveDetailToCSV();
				
				break;
			}
			case "xml": {
				mService.saveAccountToXML();
				mService.saveDetailToXML();
				
				break;
			}
			case "json": {
				mService.saveAccountToJSON();
				mService.saveDetailToJSON();
				
				break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + type);
			}
			return "redirect:Member.SelectAll/1";
		}
		return "forward:/WEB-INF/back-jsp/EmpLogin.jsp";

	}
	
	// 生成 信的外觀 的方法
		public String mailContent(String memberName, String content) {
			String MailContent = "<html>" + "<body>"
					+ "<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"max-width:600px\">" + " <tbody>"
					+ " <tr height=\"16\"></tr>" + " <tr><td>"
					+ "<table bgcolor=\"#4184F3\" width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"　style=\"min-width:332px;max-width:600px;border:1px solid #e0e0e0;border-bottom:0;border-top-left-radius:3px;border-top-right-radius:3px\">"
					+ "<tbody> <tr><td height=\"72px\" colspan=\"3\"></td></tr>"
					+ "<tr><td width=\"32px\"></td><td style=\"font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:24px;color:#ffffff;line-height:1.25\"> Döner Box - Döner&Pizza</td><td width=\"32px\"></td></tr>"
					+ "<tr><td height=\"18px\" colspan=\"3\"></td></tr></tbody></table></td></tr>"
					+ "<tr><td><table bgcolor=\"#FAFAFA\" width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"min-width:332px;max-width:600px;border:1px solid #f0f0f0;border-bottom:1px solid #c0c0c0;border-top:0;border-bottom-left-radius:3px;border-bottom-right-radius:3px\">"
					+ "<tbody> <tr height=\"16px\"><td width=\"32px\" rowspan=\"3\"></td><td></td><td width=\"32px\" rowspan=\"3\"></td> </tr>"
					+ "<tr><td><p>親愛的 " + memberName + " 會員,</p><p>" + content
					+ "</p><p>若有任何問題或需要協助，歡迎隨時與我們聯繫，客服專線：033345678 。 或者是寄電子郵件:　DonerPizza　<span style=\"color:#659cef\" dir=\"ltr\"><a href=\"mailto:h60915@gmail.com\" target=\"_blank\">&lt;h60915@gmail.com&gt;</a></span></p></td></tr>"
					+ " <tr height=\"32px\"></tr></tbody></table></td></tr> <tr height=\"16\"></tr></tbody></table>";
			return MailContent;
		}
	
}
