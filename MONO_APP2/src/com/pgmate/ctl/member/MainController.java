/* 
 * Project Name : PG_APP
 * Project      : PG_APP
 * File Name    : com.pgmate.ctl.member.NoticeController.java
 * Date	        : Feb 9, 2009
 * Version      : 1.0
 * Author       : ginaida@panworld-net.com
 * Comment      :  
 */

package com.pgmate.ctl.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.pgmate.ctl.sso.SSOBean;
import com.pgmate.model.db.dao.ChartDAO;
import com.pgmate.model.db.dao.TrnsctnDAO;
import com.pgmate.web.util.AccessUtil;
import com.pgmate.web.util.ParamUtil;

public class MainController implements Controller {
	
	private SSOBean ssoBean = null;
	
	public ModelAndView handleRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {

		ParamUtil param = new ParamUtil(request);	
		ModelAndView mav = null;
		
		try{
			if(param.getSession("sso") == null){
				mav = new ModelAndView("/common/textResponse","RESPONSE","MSG||Your session is about to expire.");
			}else{
				new AccessUtil().get(param);
				param.setAttribute("recentTrnsctn",new TrnsctnDAO().getRecentError());
				return new ModelAndView("/board");
			}	  
		}catch(Exception e){
			request.setAttribute("redirectURL","/main.jsp");
			mav = new ModelAndView("/common/redirect","message","Session Expired. ["+param.getString("request")+"]");
		}
		return mav;
	}
	
}
