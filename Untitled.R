#First , I used str() function to display the database with more clearification for myself.I recommend using head() function as it’s a really good way to know a handful of data about our database.

str(read.csv("/Users/behashirshekar/Downloads/top10s.csv"))

#The first thing  I want to work on is “Which artists and genres are the most popular”.
#To do that I made a plot of songs and their popularity.

data %>% ggplot(aes(x = title, y = pop)) + geom_point()

#My first struggle is to analyze the relation between artists and their popularity based on their songs. On this level , this is the best way came to my mind:

#1.defining artist_pop by grouping the dataset by artists and calculating their average popularity points:

artist_pop <- data %>% group_by(artist) %>% summarize(avg_pop = mean(pop))

#2.the bar chart:
artist_pop %>% ggplot(aes(x = artist, y = avg_pop)) + geom_bar(stat = "identity")
#(Good luck reading the artists)
#(P.s: Lewis Capaldi is the most popular with this formula with this code : artist_pop <- data %>% group_by(artist) %>% summarize(avg_pop = mean(pop)) %>% top_n(3, avg_pop) )

#Now lets do the other part, the relationship between genres and their popularity:
genre_pop <- data %>% group_by(top.genre) %>% summarize(avg_genre_pop = mean(pop))
genre_pop %>% ggplot(aes(x = top.genre, y = avg_genre_pop)) + geom_bar(stat = "identity")

#And escape room is the most popular.

#Now lets find the most popular song of each year:
year_pop <- data %>% group_by(year) %>% top_n(1,pop)
year_pop %>% ggplot(aes(x = year,y = pop, fill = title)) +geom_bar(stat = "identity")

