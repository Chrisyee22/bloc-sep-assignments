require_relative 'min_heap'

root = Node.new("Man on Fire", 37)
my_movies = MinHeapTree.new(root)

movie = Node.new("Moana", 96)
my_movies.insert(root, movie)

movie = Node.new("Deadpool 2", 82)
my_movies.insert(root, movie)

movie = Node.new("The Lord of the Rings: The Fellowship of the Ring", 91)
my_movies.insert(root, movie)

movie = Node.new("The Dark Knight", 94)
my_movies.insert(root, movie)

movie = Node.new("The Lord of the Rings: The Two Towers", 95)
my_movies.insert(root, movie)

movie = Node.new("Inside Out", 97)
my_movies.insert(root, movie)

movie = Node.new("The Lord of the Rings: The Return of the King", 93)
my_movies.insert(root, movie)

movie = Node.new("Back to the Future", 96)
my_movies.insert(root, movie)

movie = Node.new("Jurassic Park", 92)
my_movies.insert(root, movie)

movie = Node.new("The Rundown", 70)
my_movies.insert(root, movie)

movie = Node.new("The Fast and the Furious ", 53)
my_movies.insert(root, movie)

my_movies.printf
