public void doSomething(Animal animal) {
    if (animal instanceof Fish) {
        Fish fish = (Fish) animal;
        fish.swim();
    } else if (animal instanceof Spider) {
        Spider spider = (Spider) animal;
        spider.crawl();
    }
}
