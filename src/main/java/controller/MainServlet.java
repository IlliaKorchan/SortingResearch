package controller;

import controller.commands.BackToMain;
import controller.commands.BackToStarter;
import controller.commands.Command;
import controller.commands.ExecuteSorting;
import model.sortings.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class MainServlet extends HttpServlet {
    private Map<String, Command> commands = new HashMap<>();

    public void init(){
        commands.put("main", new BackToMain());
        commands.put("starter", new BackToStarter());
        commands.put("execute-sorting" , new ExecuteSorting());
        commands.put("bubble-sorting", new Bubble());
        commands.put("counting-sorting", new Counting());
        commands.put("insertion-sorting", new Insertion());
        commands.put("merge-sorting", new Merge());
        commands.put("quick-sorting", new Quick());
        commands.put("selection-sorting", new Selection());
        commands.put("shell-sorting", new Shell());
        commands.put("shuttle-sorting", new Shuttle());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String path = req.getRequestURI();
        path = path.replaceAll(".*/api/" , "");
        path = path.replaceAll("\\?*" , "");
        Command command = commands.getOrDefault(path , (r)->"/WEB-INF/view/index.jsp");
        String page = command.execute(req);
        req.getRequestDispatcher(page).forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF8");

        doGet(req, resp);
    }
}
