package model.sortings;

import controller.commands.Command;
import model.Sorting;

import javax.servlet.http.HttpServletRequest;

public class Quick implements Sorting, Command {
    private final String name = "Quick";
    private final String ukrName = "Метод Швидкого Сортування";
    private long time;

    @Override
    public Integer[] sort(Integer[] array) {
        long start = System.nanoTime();
        quick(array, 0, array.length - 1);
        long end = System.nanoTime();
        this.time = end - start;
        return array;
    }

    private void quick(Integer[] array, int left, int right) {
        int leftMarker = left;
        int rightMarker = right;
        int pivot = array[(leftMarker + rightMarker) / 2];
        do {
            while (array[leftMarker] < pivot) {
                leftMarker++;
            }

            while (array[rightMarker] > pivot) {
                rightMarker--;
            }

            if (leftMarker <= rightMarker) {
                if (leftMarker < rightMarker) {
                    int tmp = array[leftMarker];
                    array[leftMarker] = array[rightMarker];
                    array[rightMarker] = tmp;
                }

                leftMarker++;
                rightMarker--;
            }
        } while (leftMarker <= rightMarker);

        if (leftMarker < right) {
            quick(array, leftMarker, right);
        }
        if (left < rightMarker) {
            quick(array, left, rightMarker);
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
        return "/WEB-INF/view/sortingdescriptions/quick.jsp";
    }
}
