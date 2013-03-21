# Utility functions and helpers


# window.requestAnimationFrame
do ->
  w = window
  for vendor in ['ms', 'moz', 'webkit', 'o']
    break if w.requestAnimationFrame
    w.requestAnimationFrame = w["#{vendor}RequestAnimationFrame"]
    w.cancelAnimationFrame = (w["#{vendor}CancelAnimationFrame"] or
                              w["#{vendor}CancelRequestAnimationFrame"])

  # deal with the case where rAF is built in but cAF is not.
  if w.requestAnimationFrame
    return if w.cancelAnimationFrame
    browserRaf = w.requestAnimationFrame
    canceled = {}
    w.requestAnimationFrame = (callback) ->
      id = browserRaf (time) ->
        if id of canceled then delete canceled[id]
        else callback time
    w.cancelAnimationFrame = (id) -> canceled[id] = true

  # handle legacy browsers which don’t implement rAF
  else
    targetTime = 0
    w.requestAnimationFrame = (callback) ->
      targetTime = Math.max targetTime + 16, currentTime = +new Date
      w.setTimeout (-> callback +new Date), targetTime - currentTime

    w.cancelAnimationFrame = (id) -> clearTimeout id


# Prototype magic for n.times
Number::times = (fn) ->
  do fn for [1..@valueOf()]
  return


# Generate a random integer between lower and upper
# @param Integer lower Lower cap
# @param Integer upper Upper cap
# @return Integer Resulting random integer
randomInt = (lower, upper=0) ->
  start = Math.random()
  if not lower?
    [lower, upper] = [0, lower]
  if lower > upper
    [lower, upper] = [upper, lower]
  Math.floor(start *  (upper - lower + 1) + lower)

# Modernizr
`;window.Modernizr=function(a,b,c){function t(a){i.cssText=a}function u(a,b){return t(prefixes.join(a+";")+(b||""))}function v(a,b){return typeof a===b}function w(a,b){return!!~(""+a).indexOf(b)}function x(a,b,d){for(var e in a){var f=b[a[e]];if(f!==c)return d===!1?a[e]:v(f,"function")?f.bind(d||b):f}return!1}var d="2.6.2",e={},f=b.documentElement,g="modernizr",h=b.createElement(g),i=h.style,j,k={}.toString,l={},m={},n={},o=[],p=o.slice,q,r={}.hasOwnProperty,s;!v(r,"undefined")&&!v(r.call,"undefined")?s=function(a,b){return r.call(a,b)}:s=function(a,b){return b in a&&v(a.constructor.prototype[b],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(b){var c=this;if(typeof c!="function")throw new TypeError;var d=p.call(arguments,1),e=function(){if(this instanceof e){var a=function(){};a.prototype=c.prototype;var f=new a,g=c.apply(f,d.concat(p.call(arguments)));return Object(g)===g?g:f}return c.apply(b,d.concat(p.call(arguments)))};return e});for(var y in l)s(l,y)&&(q=y.toLowerCase(),e[q]=l[y](),o.push((e[q]?"":"no-")+q));return e.addTest=function(a,b){if(typeof a=="object")for(var d in a)s(a,d)&&e.addTest(d,a[d]);else{a=a.toLowerCase();if(e[a]!==c)return e;b=typeof b=="function"?b():b,typeof enableClasses!="undefined"&&enableClasses&&(f.className+=" "+(b?"":"no-")+a),e[a]=b}return e},t(""),h=j=null,e._version=d,e}(this,this.document);`