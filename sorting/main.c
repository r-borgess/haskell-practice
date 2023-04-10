#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Insertion sort
void insertionSort(int arr[], int n) {
  int i, j, key;
  for (i = 1; i < n; i++) {
    key = arr[i];
    j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}

// Selection sort
void selectionSort(int arr[], int n) {
  int i, j, minIdx, temp;
  for (i = 0; i < n - 1; i++) {
    minIdx = i;
    for (j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }
    temp = arr[i];
    arr[i] = arr[minIdx];
    arr[minIdx] = temp;
  }
}

// Bubble sort
void bubbleSort(int arr[], int n) {
  int i, j, temp;
  for (i = 0; i < n - 1; i++) {
    for (j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

// Quicksort
void quicksort(int arr[], int low, int high) {
  int i, j, pivot, temp;
  if (low < high) {
    pivot = arr[low];
    i = low;
    j = high;
    while (i < j) {
      while (arr[i] <= pivot && i < high) {
        i++;
      }
      while (arr[j] > pivot) {
        j--;
      }
      if (i < j) {
        temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
    temp = arr[low];
    arr[low] = arr[j];
    arr[j] = temp;
    quicksort(arr, low, j - 1);
    quicksort(arr, j + 1, high);
  }
}

// Merge sort
void merge(int arr[], int left[], int right[], int leftSize, int rightSize) {
  int i = 0, j = 0, k = 0;
  while (i < leftSize && j < rightSize) {
    if (left[i] <= right[j]) {
      arr[k++] = left[i++];
    } else {
      arr[k++] = right[j++];
    }
  }
  while (i < leftSize) {
    arr[k++] = left[i++];
  }
  while (j < rightSize) {
    arr[k++] = right[j++];
  }
}

void mergeSort(int arr[], int n) {
  if (n < 2) {
    return;
  }
  int mid = n / 2, i;
  int *left = (int *)malloc(mid * sizeof(int));
  int *right = (int *)malloc((n - mid) * sizeof(int));
  for (i = 0; i < mid; i++) {
    left[i] = arr[i];
  }
  for (i = mid; i < n; i++) {
    right[i - mid] = arr[i];
  }
  mergeSort(left, mid);
  mergeSort(right, n - mid);
  merge(arr, left, right, mid, n - mid);
  free(left);
  free(right);
}

int main() {
  int unsortedList[] = {
      977, 968, 960, 938, 935, 934, 917, 913, 913, 900, 891, 884, 880, 873, 872,
      868, 867, 862, 861, 855, 852, 849, 843, 837, 827, 820, 812, 801, 798, 797,
      778, 777, 773, 750, 745, 742, 736, 735, 733, 732, 719, 715, 712, 710, 689,
      688, 686, 673, 657, 650, 649, 647, 643, 638, 633, 629, 628, 623, 617, 615,
      612, 609, 596, 593, 592, 590, 583, 561, 559, 555, 553, 545, 545, 541, 526,
      524, 522, 501, 494, 489, 488, 487, 479, 463, 460, 447, 447, 440, 435, 427,
      409, 404, 396, 389, 385, 383, 368, 361, 360, 356, 355, 352, 345, 344, 341,
      324, 317, 312, 310, 299, 296, 285, 262, 252, 245, 242, 238, 235, 215, 199,
      198, 197, 195, 191, 187, 183, 180, 171, 157, 153, 151, 148, 145, 139, 137,
      133, 124, 122, 70,  62,  45,  15};
  int n = sizeof(unsortedList) / sizeof(unsortedList[0]);
  int i;
  // Insertion sort
  clock_t start1 = clock();
  insertionSort(unsortedList, n);
  clock_t end1 = clock();
  printf("%.8f\n", (double)(end1 - start1) / CLOCKS_PER_SEC);

  // Selection sort
  clock_t start2 = clock();
  selectionSort(unsortedList, n);
  clock_t end2 = clock();
  printf("%.8f\n", (double)(end2 - start2) / CLOCKS_PER_SEC);

  // Bubble sort
  clock_t start3 = clock();
  bubbleSort(unsortedList, n);
  clock_t end3 = clock();
  printf("%.8f\n", (double)(end3 - start3) / CLOCKS_PER_SEC);

  // Quicksort
  clock_t start4 = clock();
  quicksort(unsortedList, 0, n - 1);
  clock_t end4 = clock();
  printf("%.8f\n", (double)(end4 - start4) / CLOCKS_PER_SEC);

  // Merge sort
  clock_t start5 = clock();
  mergeSort(unsortedList, n);
  clock_t end5 = clock();
  printf("%.8f\n", (double)(end5 - start5) / CLOCKS_PER_SEC);

  return 0;
}