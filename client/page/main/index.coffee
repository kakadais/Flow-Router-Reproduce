condition = new ReactiveDict(0)
FlowRouter.route "/",
  name: "index"
  action: () ->
    window.scrollTo(0, 0)
    return BlazeLayout.render "layout", main: "index"

FlowRouter.route "/reproduce/:_data",
  name: "index2"
  action: () ->
    window.scrollTo(0, 0)
    return BlazeLayout.render "layout", main: "index"


Template.index.onCreated ->
  cl FlowRouter.getParam('_data')
  self = @
  self.autorun ->
    self.subscribe 'campInfos', 9
    img_ids = CollectionCampInfo.find().map (d) -> d.img_id
    albumImg_ids = CollectionCampAlbum.find().map (d) -> d.img_id
    arr = [img_ids, albumImg_ids].flat()
    self.subscribe 'files', arr
    self.subscribe 'campReviews', 12
    self.subscribe 'campAlbums', condition.all(),albumImg_ids

Template.index.helpers
  link: -> CollectionFiles.findOne(@img_id)?.link()

  campInfoArray: ->
    data = CollectionCampInfo.find({}, {limit: 9, sort: startAt: -1}).fetch()
    returnArray = []
    for i in [0...data.length] by 3
      returnArray.push data.slice(i, i + 3)
    return returnArray

  campAlbums: ->
    campAlbumData = CollectionCampAlbum.find({}).fetch()
    returnArray = []
    for i in [0...campAlbumData.length] by 4
      returnArray.push campAlbumData.slice(i, i + 4)
    return returnArray

  campReview: ->
    # cl "리뷰찾기", CollectionCampReview.find({}, {limit: 12, sort: createdAt: -1}).fetch()
    campReviewData = CollectionCampReview.find({}, {limit: 12, sort: createdAt: -1}).fetch()
    campReviewContent =  campReviewData.map((v)=> {content:$(v.content).text(),username:v.username,_id:v._id})
    returnReviewArray = []
    for i in [0...campReviewContent.length] by 3
      returnReviewArray.push campReviewContent.slice(i, i + 3)
    return returnReviewArray

  active : (index) ->
    switch index
      when 0 then "active"

  margin : (index) ->
#    cl index
    switch index
      when 0,1 then "me-4"

  slideClass :(index) ->
    switch index
      when 0 then "d-block"
      when 1 then "d-none d-lg-block"
      when 2 then "d-none d-xl-block"

  slideAlbumClass:(index) ->
    switch index
      when 0 then "d-block"
      when 1 then "d-none d-md-block"
      when 2 then "d-none d-lg-block"
      when 3 then "d-none d-xl-block"

Template.navbar.events({
  "click .logout": ->
    Meteor.logout()
})


