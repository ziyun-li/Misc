

import java.util.List;
import java.util.*;
import java.util.stream.Collectors;

public class DefenderArcade
{
    public int countArcades(List<String> times)
    {
        List<String> startList = new ArrayList<String>();
        List<String> endList = new ArrayList<String>();
        for(int i = 0; i < times.size(); i ++) {
            startList.add(times.get(i).split(" ")[0]);
            endList.add(times.get(i).split(" ")[1]);
    }

        List<Integer> startListInt = startList.stream().map(Integer::parseInt).collect(Collectors.toList());
        List<Integer> endListInt = endList.stream().map(Integer::parseInt).collect(Collectors.toList());
        Collections.sort(startListInt); Collections.sort(endListInt);

        int numEmployee = times.size();
        int maxCount = 0, totalCount = 0;
        int i = 0, j = 0;

        while (i < numEmployee && j < numEmployee)
        {
            // comparing the time of start and end time, increment count of employee if next time is start time
            if (startListInt.get(i) <= endListInt.get(j))
            {
                totalCount++;
                i++;

                if (totalCount > maxCount)
                {
                    maxCount = totalCount;
                }
            }
            // decrease count of employee if next time is end time
            else
            {
                totalCount--;
                j++;
            }
        }
        return maxCount;
    }
}
