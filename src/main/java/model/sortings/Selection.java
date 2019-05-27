package model.sortings;

import controller.commands.Command;
import model.Sorting;

import javax.servlet.http.HttpServletRequest;

public class Selection implements Sorting, Command {
    private final String name = "Selection";
    private final String ukrName = "Метод вибору";
    private long time;

    @Override
    public Integer[] sort(Integer[] array) {
        long start = System.nanoTime();
        for (int left = 0; left < array.length; left++) {
            int minInd = left;
            for (int i = left; i < array.length; i++) {
                if (array[i] < array[minInd]) {
                    minInd = i;
                }
            }
            swap(array, left, minInd);
        }
        long end = System.nanoTime();
        this.time = end - start;
        return array;
    }

    private void swap(Integer[] array, int index1, int index2) {
        int tmp = array[index1];
        array[index1] = array[index2];
        array[index2] = tmp;
    }

    @Override
    public long getTime() {
        return time;
    }

    @Override
    public String getUkrName() {
        return ukrName;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public String execute(HttpServletRequest req) {
        return "/WEB-INF/view/sortingdescriptions/selection.jsp";
    }
}
