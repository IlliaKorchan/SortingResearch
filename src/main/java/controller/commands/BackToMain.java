package controller.commands;

import javax.servlet.http.HttpServletRequest;

public class BackToMain implements Command {
    @Override
    public String execute(HttpServletRequest req) {
        return "/WEB-INF/view/index.jsp";
    }
}
