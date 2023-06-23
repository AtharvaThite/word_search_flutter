List<int> WordSearch(List<List<String>> alphabets, String word, int r, int c) {
  List<int> index = [];

  bool found = false;
  int wordlen = word.length;

  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      if (alphabets[i][j] == word[0]) {
        //Horizontal Word Search
        if (r - wordlen >= i) {
          int count = 0;
          int k;
          for (k = i; k < i + wordlen; k++) {
            if (alphabets[k][j] == word[count]) {
              found = true;
              count++;
            } else {
              found = false;
            }
          }
          if (found) {
            print("Found");
            for (int l = i; l < k; l++) {
              index.add((j * r) + l);
            }
          } else {
            print("Not Found");
          }
        }

        //Vertical Word Search
        if (c - wordlen >= j) {
          int count = 0;
          int k;
          for (k = j; k < j + wordlen; k++) {
            if (alphabets[i][k] == word[count]) {
              found = true;
              count++;
            } else {
              found = false;
            }
          }
          if (found) {
            print("Found");
            for (int l = j; l < k; l++) {
              index.add((l * r) + i);
            }
          } else {
            print("Not Found");
          }
        }
        //Diagonal Word Search
        if (c - wordlen >= j && r - wordlen >= i) {
          int count = 0;
          int k;
          int m = i;
          for (k = j; k < j + wordlen && m < i + wordlen; k++) {
            if (alphabets[m][k] == word[count]) {
              found = true;
              count++;
            } else {
              found = false;
            }
            m++;
          }
          if (found) {
            print("Found");
            int cnt = 0;
            for (int l = j; l < k; l++) {
              index.add(((l * r) + i) + cnt);
              cnt++;
            }
          } else {
            print("Not Found");
          }
        }
      }
    }
  }
  print(index);
  return index;
}
