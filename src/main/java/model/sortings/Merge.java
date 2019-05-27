package model.sortings;

import controller.commands.Command;
import model.Sorting;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

public class Merge implements Sorting, Command {
    private final String name = "Merge";
    private final String ukrName = "Метод злиття";
    private long time;

    @Override
    public Integer[] sort(Integer[] array) {
        long start = System.nanoTime();
        merge(array, 0, array.length - 1);
        long end = System.nanoTime();
        this.time = end - start;
        return array;
    }

    private void merge(Integer[] array, int left, int right) {
        if (right <= left)
            return;

        int middle = left + (right - left) / 2;
        merge(array, left, middle);
        merge(array, middle + 1, right);

        Integer[] buf = Arrays.copyOf(array, array.length);

        for (int k = left; k <= right; k++)
            buf[k] = array[k];

        int i = left, j = middle + 1;
        for (int k = left; k <= right; k++) {

            if (i > middle) {
                array[k] = buf[j];
                j++;
            } else if (j > right) {
                array[k] = buf[i];
                i++;
            } else if (buf[j] < buf[i]) {
                array[k] = buf[j];
                j++;
            } else {
                array[k] = buf[i];
                i++;
            }
        }
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
        return "/WEB-INF/view/sortingdescriptions/merge.jsp";
    }
}
