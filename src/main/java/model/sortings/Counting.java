package model.sortings;

import controller.commands.Command;
import model.Sorting;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Comparator;

public class Counting implements Sorting, Command {
    private final String name = "Counting";
    private final String ukrName = "Метод Підрахунку";
    private long time;

    @Override
    public Integer[] sort(Integer[] array) {
        long start = System.nanoTime();
        counting(array, Arrays.stream(array).max(Comparator.naturalOrder()).get());
        long end = System.nanoTime();
        this.time = end - start;
        return array;
    }

    private Integer[] counting(Integer[] array, int max) {
        int[] numCounts = new int[max + 1];

        for (int num : array) {
            numCounts[num]++;
        }

        Integer[] sortedArray = new Integer[array.length];
        int currentSortedIndex = 0;

        for (int n = 0; n < numCounts.length; n++) {
            int count = numCounts[n];

            for (int k = 0; k < count; k++) {
                sortedArray[currentSortedIndex] = n;
                currentSortedIndex++;
            }
        }
        return sortedArray;
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
        return "/WEB-INF/view/sortingdescriptions/counting.jsp";
    }
}
