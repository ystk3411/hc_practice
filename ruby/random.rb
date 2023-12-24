members = %w[A B C D E F]
index_array = [[2, 4], [3, 3]]
shuffled_members = members.shuffle
sampled_index_array = index_array.sample
group1 = shuffled_members.slice(0, sampled_index_array[0])
group2 = shuffled_members.slice(sampled_index_array[0], sampled_index_array[1])
p group1.sort, group2.sort