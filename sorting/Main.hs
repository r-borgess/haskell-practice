import Data.Time

-- Insertion sort
insertionSort :: Ord a => [a] -> [a]
insertionSort [] = []
insertionSort (x : xs) = insert x (insertionSort xs)
  where
    insert x [] = [x]
    insert x (y : ys)
      | x <= y = x : y : ys
      | otherwise = y : insert x ys

-- Selection sort
selectionSort :: Ord a => [a] -> [a]
selectionSort [] = []
selectionSort xs =
  let (minVal, rest) = extractMin xs
   in minVal : selectionSort rest
  where
    extractMin [x] = (x, [])
    extractMin (x : xs) =
      let (minVal, rest) = extractMin xs
       in if x < minVal
            then (x, minVal : rest)
            else (minVal, x : rest)

-- Bubble sort
bubbleSort :: Ord a => [a] -> [a]
bubbleSort xs = foldr bubble [] xs
  where
    bubble x [] = [x]
    bubble x (y : ys)
      | x <= y = x : y : ys
      | otherwise = y : bubble x ys

-- Quicksort
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
  quicksort [y | y <- xs, y < x]
    ++ [x]
    ++ quicksort [y | y <- xs, y >= x]

-- Merge sort
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys)
  | x <= y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys

mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort left) (mergeSort right)
  where
    (left, right) = split xs
    split xs =
      let n = length xs `div` 2
       in (take n xs, drop n xs)

main :: IO ()
main = do
  start <- getCurrentTime
  let unsortedList = [4, 1, 8, 3, 6, 2, 7, 5]
      sortedList1 = insertionSort unsortedList
      sortedList2 = selectionSort unsortedList
      sortedList3 = bubbleSort unsortedList
      sortedList4 = quicksort unsortedList
      sortedList5 = mergeSort unsortedList
  end <- getCurrentTime
  putStrLn $ "Elapsed Time (Insertion Sort): " ++ show (diffUTCTime end start)

  start2 <- getCurrentTime
  let sortedList2 = selectionSort unsortedList
  end2 <- getCurrentTime
  putStrLn $ "Elapsed Time (Selection Sort): " ++ show (diffUTCTime end2 start2)

  -- Bubble sort
  start3 <- getCurrentTime
  let sortedList3 = bubbleSort unsortedList
  end3 <- getCurrentTime
  putStrLn $ "Elapsed Time (Bubble Sort): " ++ show (diffUTCTime end3 start3)

  -- Quicksort
  start4 <- getCurrentTime
  let sortedList4 = quicksort unsortedList
  end4 <- getCurrentTime
  putStrLn $ "Elapsed Time (Quicksort): " ++ show (diffUTCTime end4 start4)

  -- Merge Sort
  start5 <- getCurrentTime
  let sortedList5 = mergeSort unsortedList
  end5 <- getCurrentTime
  putStrLn $ "Elapsed Time (Merge Sort): " ++ show (diffUTCTime end5 start5)
