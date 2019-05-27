package controller.commands;

import javax.servlet.http.HttpServletRequest;

public class BackToStarter implements Command {
    @Override
    public String execute(HttpServletRequest req) {
        return "/WEB-INF/view/ChoosePage.jsp";
    }

}
