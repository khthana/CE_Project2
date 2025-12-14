package util;

public final class ArraySort {

    public static interface Comparable {
	public int compareTo(Comparable other);
    }

    public static void sort(Comparable[] arr) {
	sort(arr, 0, arr.length);
    }

    public static void sort(Comparable[] arr, int start, int end) {
        Comparable aux[] = (Comparable[])arr.clone();
	mergeSort(aux, arr, start, end);
    }

    private static void mergeSort(Comparable[] src, Comparable[] dest,
                                  int low, int high) {
	int length = high - low;

	// Insertion sort on smallest arrays
	if(length < 7) {
	    for(int i = low; i < high; i++)
		for(int j = i; j > low && dest[j - 1].compareTo(dest[j]) > 0;
		    j--)
		    swap(dest, j, j - 1);
	    return;
	}

        // Recursively sort halves of dest into src
        int mid = (low + high) / 2;
        mergeSort(dest, src, low, mid);
        mergeSort(dest, src, mid, high);

        // If list is already sorted, just copy from src to dest.  This is an
        // optimization that results in faster sorts for nearly ordered lists.
        if(src[mid - 1].compareTo(src[mid]) <= 0) {
	    System.arraycopy(src, low, dest, low, length);
	    return;
        }

        // Merge sorted halves (now in src) into dest
        for(int i = low, p = low, q = mid; i < high; i++) {
            if(q >= high || p < mid && src[p].compareTo(src[q]) <= 0)
                dest[i] = src[p++];
            else
                dest[i] = src[q++];
        }
    }

    private static void swap(Object list[], int a, int b) {
	Object tmp = list[a];
	list[a] = list[b];
	list[b] = tmp;
    }

}
