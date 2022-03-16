class SliderModel {
  String title='';
  String description='';

  SliderModel();

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }


  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}
List<SliderModel> getSlides(){
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel();

  // Item 1
  sliderModel.setTitle("Title 1");
  sliderModel.setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nunc etiam velit hendrerit lectus dignissim luctus accumsan, aenean. In tincidunt tempor dignissim elementum amet non. Nulla porttitor vulputate convallis tristique a. ");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  // Item 2
  sliderModel.setTitle("Title 2");
  sliderModel.setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nunc etiam velit hendrerit lectus dignissim luctus accumsan, aenean. In tincidunt tempor dignissim elementum amet non. Nulla porttitor vulputate convallis tristique a. ");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  sliderModel.setTitle("Title 3");
  sliderModel.setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nunc etiam velit hendrerit lectus dignissim luctus accumsan, aenean. In tincidunt tempor dignissim elementum amet non. Nulla porttitor vulputate convallis tristique a. ");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  return slides;

}