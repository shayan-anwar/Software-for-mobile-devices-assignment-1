void main() {
  final lines = [
    ["This", "is", "a", "really", "really", "really", "cool", "experiment", "really"],
    ["Cute", "little", "experiment"],
    ["Will", "it", "work", "maybe", "it", "will", "work", "do", "you", "think", "it", "will", "it", "will"]
  ];
  
  final Map<int, List<String>> words_per_line = {};
  final Map<int, int> freq_per_line = {};
  
  for (int i = 0; i < lines.length; i++) {
    final words = lines[i];
    final word_freq = <String, int>{};
    
    for (final word in words) {
      word_freq[word] = (word_freq[word] ?? 0) + 1;
    }
    
    final max_freq = word_freq.values.reduce((a, b) => a > b ? a : b);
    final max_freq_words = word_freq.entries.where((entry) => entry.value == max_freq).map((entry) => entry.key).toList();
    words_per_line[i + 1] = max_freq_words;
    freq_per_line[i + 1] = max_freq;
  }
  final result_freq = freq_per_line.values.reduce((a, b) => a > b ? a : b);

  final result_line = freq_per_line.entries.where((entry) => entry.value == result_freq).map((entry) => entry.key).toList();

  print('The following words have the highest word frequency per line:');
  for (final line_num in words_per_line.keys) {
    final words = words_per_line[line_num]!;
    print('$words (appears in line #$line_num)');
  }

  print('\nThe following lines have the greatest highest frequency word count ($result_freq):');
  for (final line_num in result_line) {
    print('Line #$line_num');
  }
}