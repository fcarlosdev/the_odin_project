require_relative "models"

Fish.destroy_all

Fish.create([
  {
    name: "Clownfish",
    image_url: "http://www.leisurepro.com/blog/wp-content/uploads/2010/04/Ocellaris-Clownfish.jpg",
    description: "This fish really isn't very funny."
  },
  {
    name: "Goldfish",
    image_url: "http://www.newsworks.org/images/stories/flexicontent/l_shutterstock_goldfish_1200x675.jpg",
    description: "Named for Goldie Hawn. Its name has nothing to do with its color."
  },
  {
    name: "Phish",
    image_url: "http://bizopy.com/wp-content/uploads/2013/08/phish.jpg",
    description: "Known to occasionally grow dreadlocks and smell funny."
  }

])
