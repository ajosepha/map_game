module ApplicationHelper
  def randomized_background_image
    images =["assets/bridge.jpg", "assets/chrystler.jpg", "assets/coney-island
      .jpg", "assets/coney2.jpg", "assets/dumbo.jpg", "assets/grand_central.jpg", "assets/life.jpg",
      "assets/life.jpg", "assets/lower.jpg"]
    images[rand(images.size)]
  end
end
