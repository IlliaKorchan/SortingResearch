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
    private List<Sorting> sorters = new ArrayList<>(Arrays.asList(new Bubble(), new Counting(), new Insertion(), new Merge(),
            new Quick(), new Selection(), new Shell(), new Shuttle()));

    private String sortings;
    private String times;

    @Override
    public String execute(HttpServletRequest req) {
        if (req.getParameter("select") != null) {
            List<String> chosen;
            if (req.getParameter("Sorting").contains("All")) {
                chosen = new ArrayList<>();
                sorters.stream().forEach(s -> chosen.add(s.getName()));
            } else {
                chosen = new ArrayList(Arrays.asList(req.getParameterValues("Sorting")));
            }
            fill(chosen);
            req.setAttribute("sortings", sortings);
            req.setAttribute("times", times);
        }
        return "/WEB-INF/view/SortingResults.jsp";
    }

    private void fill(List<String> chosen) {
        Integer[][] arraysToSort = { generateArray(10),
                                     generateArray(50),
                                     generateArray(100),
                                     generateArray(500),
                                     generateArray(1000),
                                     generateArray(2500),
                                     generateArray(5000),
                                     generateArray(10000)};

        List<String> results = new ArrayList<>();
        BigDecimal[][] timesArray = new BigDecimal[chosen.size()][arraysToSort.length];
        for (int i = 0; i < chosen.size(); i++) {
            for (int j = 0; j < sorters.size(); j++) {
                if (sorters.get(j).getName().equalsIgnoreCase(chosen.get(i))) {
                    for (int k = 0; k < arraysToSort.length; k++) {
                        sorters.get(j).sort(arraysToSort[i]);
                        timesArray[i][k] = BigDecimal.valueOf(sorters.get(j).getTime() / 1000000.0);
                    }
                    results.add(sorters.get(j).getUkrName());
                }
            }
        }
        sortings = getArrayString(results);
        times = getTimeString(timesArray);
    }

    private Integer[] generateArray(int amountOfNumbers) {
        Integer[] array = new Integer[amountOfNumbers];
        Random random = new Random();
        for (int i = 0; i < array.length; i++) {
            array[i] = random.nextInt(amountOfNumbers * 2);
        }
        return array;
    }

    private String getArrayString(List<String> items) {
        String result = "[";
        for(int i = 0; i < items.size(); i++) {
            result += "\'" + items.get(i) + "\'";
            if(i < items.size() - 1) {
                result += ", ";
            }
        }
        result += "]";

        return result;
    }

    private String getTimeString(BigDecimal[][] times) {
        String result = "[[";
        for (int i = 0; i < times.length; i++) {
            for (int j = 0; j < times[i].length; j++) {
                result += times[i][j];

                if( j < times.length - 1) {
                    result += ", ";
                }
            }
            result += "]";

            if( i < times.length - 1) {
                result += ",[";
            }
        }
        result += "]";

        return result;
    }
}
