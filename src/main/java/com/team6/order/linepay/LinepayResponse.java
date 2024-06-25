package com.team6.order.linepay;

import com.fasterxml.jackson.annotation.JsonProperty;

public class LinepayResponse {

	private String returnCode;
    private String returnMessage;
    private Info info;
    
    public LinepayResponse() {
	}

	public LinepayResponse(String returnCode, String returnMessage, Info info) {
		this.returnCode = returnCode;
		this.returnMessage = returnMessage;
		this.info = info;
	}

	public String getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}

	public String getReturnMessage() {
		return returnMessage;
	}

	public void setReturnMessage(String returnMessage) {
		this.returnMessage = returnMessage;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public static class Info {
        @JsonProperty("paymentUrl")
        private PaymentUrl paymentUrl;
        private long transactionId;
        private String paymentAccessToken;
        
        public Info(PaymentUrl paymentUrl, long transactionId, String paymentAccessToken) {
        	this.paymentUrl = paymentUrl;
        	this.transactionId = transactionId;
        	this.paymentAccessToken = paymentAccessToken;
        }
        
        public Info() {
        }
        
		public PaymentUrl getPaymentUrl() {
			return paymentUrl;
		}
		
		public void setPaymentUrl(PaymentUrl paymentUrl) {
			this.paymentUrl = paymentUrl;
		}
		
		public long getTransactionId() {
			return transactionId;
		}
		
		public void setTransactionId(long transactionId) {
			this.transactionId = transactionId;
		}
		
		public String getPaymentAccessToken() {
			return paymentAccessToken;
		}
		
		public void setPaymentAccessToken(String paymentAccessToken) {
			this.paymentAccessToken = paymentAccessToken;
		}
		
    }

    public static class PaymentUrl {
        private String web;
        private String app;
        
		public PaymentUrl() {
		}
		
		public PaymentUrl(String web, String app) {
			this.web = web;
			this.app = app;
		}
		
		public String getWeb() {
			return web;
		}
		public void setWeb(String web) {
			this.web = web;
		}
		public String getApp() {
			return app;
		}
		public void setApp(String app) {
			this.app = app;
		}

    }
    
    private String transactionId;

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

    
	
}
