#커피는 그냥이 지역  /콜렉션은 어디서든 사용됧수있도록 this를 붙여 전역으로!
#메인+소개
@CollectionCampInfo = new Mongo.Collection 'campInfo'
#소개공지
@CollectionCampNoti = new Mongo.Collection 'campNoti'
#앨범
@CollectionCampAlbum = new Mongo.Collection 'campAlbum'
#앨범
@CollectionCampAlbumImages = new Mongo.Collection 'campAlbumImages'
#후기
@CollectionCampReview = new Mongo.Collection 'campReview'
#상담
@CollectionContact = new Mongo.Collection 'contact'
#국제상담
@CollectionInternationalContact = new Mongo.Collection 'internationalContact'
@CollectionPublish = new Mongo.Collection '_publish'
@CollectionLogs = new Mongo.Collection 'logs'

if Meteor.isServer
#  Meteor에서 서버가 실행중이라면
  CollectionCampInfo.allow({
#    allow() 매서드는 지정된 컬렉션에 대한 권한을 설정
    insert: (->if Meteor.userId() then true),
    update: (->if Meteor.userId() then true),
    remove: (->if Meteor.userId() then true)
#    admin만 crud가 가능해야하므로
  });

  CollectionCampNoti.allow({
    insert: (->if Meteor.userId() then true),
    update: (-> if Meteor.userId() then true),
    remove: (-> if Meteor.userId() then true)
  })

  CollectionCampInfo._ensureIndex({
#    _ensureIndex() 매서드를 사용해 CollectionCampInfo컬렉션의 createdAt필드에 인덱스가 내림차순으로 생성되도록한다
    'createdAt': -1
  })

  CollectionCampAlbum.allow({
    insert: (->if Meteor.userId() then true),
    update: (->if Meteor.userId() then true),
    remove: (->if Meteor.userId() then true)
  });
  CollectionCampAlbum._ensureIndex({
    'createdAt': -1
  });

  CollectionCampAlbumImages.allow({
    insert: (->if Meteor.userId() then true),
    update: (->if Meteor.userId() then true),
    remove: (->if Meteor.userId() then true)
  });
  CollectionCampAlbumImages._ensureIndex({
    'createdAt': -1
  });

  CollectionCampReview.allow({
#    관리자 뿐만 아니라 모든사용자가 insert, update는 가능해야된다
    insert: ()->true,
    update: ()->true,
    remove: (->if Meteor.userId() then true)
  });
  CollectionCampReview._ensureIndex({
    'createdAt': -1
  });

  CollectionContact.allow({
    insert: ()->true,
    update: (->if Meteor.userId() then true),
    remove: (->if Meteor.userId() then true)
  })
  CollectionContact._ensureIndex({
    'createdAt': -1
  })

  CollectionInternationalContact.allow({
    insert: ()->true,
    update: (->if Meteor.userId() then true),
    remove: (->if Meteor.userId() then true)
  })
  CollectionInternationalContact._ensureIndex({
    'createdAt': -1
  })
