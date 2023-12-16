members = ["A","B","C","D","E","F"]
index_array = [[2,4],[3,3]]
shuffled_members = members.shuffle
shuffled_index_array = index_array.shuffle
group1 = shuffled_members.slice(0,shuffled_index_array[0][0])
group2 = shuffled_members.slice(shuffled_index_array[0][0],shuffled_index_array[0][1])
puts  group1.sort.to_s,group2.sort.to_s