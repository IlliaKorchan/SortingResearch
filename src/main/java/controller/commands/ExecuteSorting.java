package controller.commands;

import controller.services.StringProcessor;
import model.Sorting;
import model.sortings.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.Map;


public class ExecuteSorting implements Command {
    private List<Sorting> sorters = new ArrayList<>(Arrays.asList(new Bubble(), new Counting(), new Insertion(), new Merge(),
            new Quick(), new Selection(), new Shell(), new Shuttle()));
    private List<Integer> basicAmounts = new ArrayList<>(Arrays.asList(10, 50, 100, 500, 1000, 2500, 5000, 10000));
    private Integer customAmount;
    private StringProcessor processor = new StringProcessor();

    private String sortings;
    private String times;
    private Map<String, BigDecimal[]> toSend;

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
                req.setAttribute("sortings", sortings);
                req.setAttribute("times", times);
                req.setAttribute("sortTimes", toSend);
            } else {
                return "/WEB-INF/view/ChoosePage.jsp";
            }
        }
        return "/WEB-INF/view/SortingResults.jsp";
    }

    private void fill(List<String> chosen) {
        List<Integer[]> arraysToSort = new ArrayList<>();
        createAmounts();
        basicAmounts.stream().forEach(n -> arraysToSort.add(generateArray(n)));

        List<String> results = new ArrayList<>();
        BigDecimal[][] timesArray = new BigDecimal[chosen.size()][arraysToSort.size()];
        for (int i = 0; i < chosen.size(); i++) {
            for (int j = 0; j < sorters.size(); j++) {
                if (sorters.get(j).getName().equalsIgnoreCase(chosen.get(i))) {
                    for (int k = 0; k < arraysToSort.size(); k++) {
                        sorters.get(j).sort(arraysToSort.get(i));
                        timesArray[i][k] = BigDecimal.valueOf(sorters.get(j).getTime() / 1000000.0);
                    }
                    results.add(sorters.get(j).getUkrName());
                }
            }
        }
        sendAsMap(results, timesArray);
        sortings = processor.getArrayString(results);
        times = processor.getTimeString(timesArray);
    }

    private Integer[] generateArray(int amountOfNumbers) {
        Integer[] array = new Integer[amountOfNumbers];
        Random random = new Random();
        for (int i = 0; i < array.length; i++) {
            array[i] = random.nextInt(amountOfNumbers * 2);
        }
        return array;
    }


    private Map<String, BigDecimal[]> sendAsMap(List<String> names, BigDecimal[][] times) {
        toSend = new HashMap<>();
        for (int i = 0; i < names.size(); i++) {
            String name = names.get(i).replaceAll("Метод ", "");
            toSend.put(name, times[i]);
        }

        return toSend;
    }

    private void createAmounts() {
        if (customAmount != null) {
            for (int i = 0; i < basicAmounts.size(); i++) {
                if (customAmount < basicAmounts.get(i)) {
                    basicAmounts.add(i, customAmount);
                }
            }
        }
    }

    public void setCustomAmount(int customAmount) {
        this.customAmount = customAmount;
    }
}
