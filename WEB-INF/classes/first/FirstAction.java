package first;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import util.YogiConstants;

public class FirstAction implements SessionAware{
	
	private Map session;

	public String execute() throws Exception {
		session.put(YogiConstants.SAVEURI, "main.action");
		return "success";
	}

	@Override
	public void setSession(Map session) {
		this.session = session;
	}

}
