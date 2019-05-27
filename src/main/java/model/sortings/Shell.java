package model.sortings;

import controller.commands.Command;
import model.Sorting;

import javax.servlet.http.HttpServletRequest;

public class Shell implements Sorting, Command {
    private final String name = "Shell";
    private final String ukrName = "Метод Шелла";
    private long time;

    @Override
    public Integer[] sort(Integer[] array) {
        long start = System.nanoTime();
        int gap = array.length / 2;
        while (gap >= 1) {
            for (int right = 0; right < array.length; right++) {
                for (int c = right - gap; c >= 0; c -= gap) {
                    if (array[c] > array[c + gap]) {
                        swap(array, c, c + gap);
                    }
                }
            }
            gap = gap / 2;
        }
        long end = System.nanoTime();
        this.time = end - start;
        return array;
    }

    private static void swap(Integer[] array, int index1, int index2) {
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
        return "/WEB-INF/view/sortingdescriptions/shell.jsp";
    }
}
