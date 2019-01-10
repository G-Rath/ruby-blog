/**
 * Entry file for the application.
 *
 * This function is called once the application is "ready",
 * making it safe to use `$` and other such things.
 */
export default () => {
  const myFn = (param: string) => console.log(param);

  myFn('Hello World from Webpacker');

  console.log($('body'));
}
