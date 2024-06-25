package com.team6.promotions.controller;

import com.team6.member.model.MemberAccountBean;
import com.team6.promotions.model.Promotions;
import com.team6.promotions.model.PromotionsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Controller
public class FrontPromotionsController {

    @Autowired
    private PromotionsService promotionsService;


    //前台輪盤抽獎，alert回傳折扣碼
    //http://localhost:8080/getDiscountCode?promotionsName={}
    @GetMapping("/getDiscountCode")
    @ResponseBody
    public String getDiscountCode(@RequestParam String promotionsName) {
        return promotionsService.getDiscountCode(promotionsName);
    }

    // 查詢本月活動
    @GetMapping("/promotions/promotionsFront")
    public String getPromotionsDate(Model model,
                                    @SessionAttribute(value = "member", required = false) MemberAccountBean accountBean,
                                    HttpSession session) {
        if (accountBean != null) {
            List<Promotions> promotions = promotionsService.getPromotionsForCurrentMonth();
            model.addAttribute("promotions", promotions);
            model.addAttribute("member", accountBean);
            return "front-html/promotions/monthPromotions";
        }
        session.invalidate();
        return "forward:/WEB-INF/front-jsp/Login.jsp";
    }

    @GetMapping("/promotions/lottery")
    public String getLotteryPage(Model model,
                                 @SessionAttribute(value = "member", required = false) MemberAccountBean accountBean,
                                 HttpSession session) {
        if (accountBean != null) {
        model.addAttribute("member", accountBean);
        return "front-html/promotions/lottery";
    }
    session.invalidate();
        return "forward:/WEB-INF/front-jsp/Index.jsp";
}


}
