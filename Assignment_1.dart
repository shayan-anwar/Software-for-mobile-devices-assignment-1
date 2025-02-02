void main() {
  final lines = [
    ["This", "is", "a", "really", "really", "really", "cool", "experiment", "really"],
    ["Cute", "little", "experiment"],
    ["Will", "it", "work", "maybe", "it", "will", "work", "do", "you", "think", "it", "will", "it", "will"]
  ];

  final Map<int, List<String>> words_per_line = {};
  final Map<int, int> freq_per_line = {};

  for (int i = 0; i < lines.length; i++) {
    final word_freq = <String, int>{};

    for (final word in lines[i]) {
      word_freq[word] = (word_freq[word] ?? 0) + 1;
    }

    final max_freq = word_freq.values.reduce((a, b) => a > b ? a : b);
    words_per_line[i + 1] = word_freq.entries.where((e) => e.value == max_freq).map((e) => e.key).toList();
    freq_per_line[i + 1] = max_freq;
  }

  final result_freq = freq_per_line.values.reduce((a, b) => a > b ? a : b);
  final result_line = freq_per_line.keys.where((k) => freq_per_line[k] == result_freq);

  print('The following words have the highest word frequency per line:');
  words_per_line.forEach((line, words) => print('$words (appears in line #$line)'));

  print('\nThe following lines have the greatest highest frequency word count ($result_freq):');
  result_line.forEach((line) => print('Line #$line'));
}
