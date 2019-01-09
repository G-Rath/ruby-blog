/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import jQuery from 'jquery';

/*
  jQuery definitions declare it as global, and it usually is,
  so for the sake of ease-of-development, just assign it to the window.
 */
// @ts-ignore -- technically an error b/c window.$ isn't defined
window.$ = jQuery;

$(() => {
  const myFn = (param: string) => console.log(param);

  myFn('Hello World from Webpacker');

  console.log($('body'));
});
