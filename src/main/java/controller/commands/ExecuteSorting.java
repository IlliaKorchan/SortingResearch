package controller.commands;

import model.Sorting;
import model.sortings.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class ExecuteSorting implements Command {
    List<Sorting>sorters = new ArrayList<>(Arrays.asList(new Bubble(), new Counting(), new Insertion(), new Merge(),
            new Quick(), new Selection(), new Shell(), new Shuttle()));
    List<String> results = new ArrayList<>();

    @Override
    public String execute(HttpServletRequest req) {
        if (req.getParameter("select") != null) {
            if (req.getParameterValues("Sorting") != null) {
                List<String> chosen;
                if (req.getParameter("Sorting").contains("All")) {
                    chosen = new ArrayList<>();
                    sorters.stream().forEach(s -> chosen.add(s.getName()));
                } else {
                    chosen = new ArrayList(Arrays.asList(req.getParameterValues("Sorting")));
                }
                fill(chosen);
                req.setAttribute("results", results);
                return "/WEB-INF/view/SortingResults.jsp";
            } else {
                String warning = "Не вибрано жодного алгоритму!";
                req.setAttribute(warning, "warning");
                return "/WEB-INF/view/ChoosePage.jsp";
            }
        } else {
            String warning = "Не вибрано жодного алгоритму!";
            return "/WEB-INF/view/ChoosePage.jsp";
        }
    }

    private void fill(List<String> chosen) {
        results.clear();
        Integer[] array10 = generateArray(10);
        Integer[] array50 = generateArray(50);
        Integer[] array100 = generateArray(100);
        Integer[] array500 = generateArray(500);
        Integer[] array1000 = generateArray(1000);
        Integer[] array2500 = generateArray(2500);
        Integer[] array5000 = generateArray(5000);
        Integer[] array10000 = generateArray(10000);


        for (int i = 0; i < chosen.size(); i++) {
            for (int j = 0; j < sorters.size(); j++) {
                if (sorters.get(j).getName().equalsIgnoreCase(chosen.get(i))) {
                    sorters.get(j).sort(smallArray);
                    long smallTime = sorters.get(j).getTime();
                    sorters.get(j).sort(mediumArray);
                    long mediumTime = sorters.get(j).getTime();
                    sorters.get(j).sort(bigArray);
                    long bigTime = sorters.get(j).getTime();
                    results.add(sorters.get(j).getUkrName() + ":" + " 10 елементів: " + BigDecimal.valueOf((double)smallTime / 1000000)
                                + " мс 1000 елементів: " + BigDecimal.valueOf((double) mediumTime / 1000000)
                                + " мс 10000 елементів: " + BigDecimal.valueOf((double) bigTime / 1000000) + " мс");
                }
            }
        }
    }

    private Integer[] generateArray(int amountOfNumbers) {
        Integer[] array = new Integer[amountOfNumbers];
        Random random = new Random();
        for (int i = 0; i < array.length; i++) {
            array[i] = random.nextInt(amountOfNumbers * 2);
        }
        return array;
    }
}
