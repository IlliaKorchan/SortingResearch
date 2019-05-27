package model.sortings;

import controller.commands.Command;
import model.Sorting;

import javax.servlet.http.HttpServletRequest;

public class Bubble implements Sorting, Command {
    private final String name = "Bubble";
    private final String ukrName = "Метод \"Бульбашки\"";
    private long time;

    @Override
    public Integer[] sort(Integer[] array) {
        long start = System.nanoTime();
        boolean needIteration = true;
        while (needIteration) {
            needIteration = false;
            for (int i = 1; i < array.length; i++) {
                if (array[i] < array[i - 1]) {
                    swap(array, i, i-1);
                    needIteration = true;
                }
            }
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
    public String getUkrName() {
        return ukrName;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public long getTime() {
        return time;
    }

    @Override
    public String execute(HttpServletRequest req) {
        return "/WEB-INF/view/sortingdescriptions/bubble.jsp";
    }
}
