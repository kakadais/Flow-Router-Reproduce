import AOS from 'aos';
import 'aos/dist/aos.css'; # You can also use <link> for styles
import { ReactiveDict } from 'meteor/reactive-dict'

Template.layout.onCreated ->
Template.layout.onRendered ->
  AOS.init()