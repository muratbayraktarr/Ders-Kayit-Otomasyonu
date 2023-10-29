!function(){function a(a,b,c){"undefined"==typeof c&&(c=b,optionsValues=void 0);var d="undefined"!=typeof a?a:b;if("undefined"==typeof d)return null;if("function"==typeof d){var e=[c];return c.geography&&(e=[c.geography,c.data]),d.apply(null,e)}return d}function b(a,b,c){return this.svg=n.select(a).append("svg").attr("width",c||a.offsetWidth).attr("data-width",c||a.offsetWidth).attr("class","datamap").attr("height",b||a.offsetHeight).style("overflow","hidden"),this.options.responsive&&(n.select(this.options.element).style({position:"relative","padding-bottom":100*this.options.aspectRatio+"%"}),n.select(this.options.element).select("svg").style({position:"absolute",width:"100%",height:"100%"}),n.select(this.options.element).select("svg").select("g").selectAll("path").style("vector-effect","non-scaling-stroke")),this.svg}function c(a,b){var c,d,e=b.width||a.offsetWidth,f=b.height||a.offsetHeight,g=this.svg;return b&&"undefined"==typeof b.scope&&(b.scope="world"),"usa"===b.scope?c=n.geo.albersUsa().scale(e).translate([e/2,f/2]):"world"===b.scope&&(c=n.geo[b.projection]().scale((e+1)/2/Math.PI).translate([e/2,f/("mercator"===b.projection?1.45:1.8)])),"orthographic"===b.projection&&(g.append("defs").append("path").datum({type:"Sphere"}).attr("id","sphere").attr("d",d),g.append("use").attr("class","stroke").attr("xlink:href","#sphere"),g.append("use").attr("class","fill").attr("xlink:href","#sphere"),c.scale(250).clipAngle(90).rotate(b.projectionConfig.rotation)),d=n.geo.path().projection(c),{path:d,projection:c}}function d(){n.select(".datamaps-style-block").empty()&&n.select("head").append("style").attr("class","datamaps-style-block").html('.datamap path.datamaps-graticule { fill: none; stroke: #777; stroke-width: 0.5px; stroke-opacity: .5; pointer-events: none; } .datamap .labels {pointer-events: none;} .datamap path {stroke: #FFFFFF; stroke-width: 1px;} .datamaps-legend dt, .datamaps-legend dd { float: left; margin: 0 3px 0 0;} .datamaps-legend dd {width: 20px; margin-right: 6px; border-radius: 3px;} .datamaps-legend {padding-bottom: 20px; z-index: 1001; position: absolute; left: 4px; font-size: 12px; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;} .datamaps-hoverover {display: none; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; } .hoverinfo {padding: 4px; border-radius: 1px; background-color: #FFF; box-shadow: 1px 1px 5px #CCC; font-size: 12px; border: 1px solid #CCC; } .hoverinfo hr {border:1px dotted #CCC; }')}function e(b){var c=this.options.fills,d=this.options.data||{},e=this.options.geographyConfig,f=this.svg.select("g.datamaps-subunits");f.empty()&&(f=this.addLayer("datamaps-subunits",null,!0));var g=o.feature(b,b.objects[this.options.scope]).features;e.hideAntarctica&&(g=g.filter(function(a){return"ATA"!==a.id})),e.hideHawaiiAndAlaska&&(g=g.filter(function(a){return"HI"!==a.id&&"AK"!==a.id}));var h=f.selectAll("path.datamaps-subunit").data(g);h.enter().append("path").attr("d",this.path).attr("class",function(a){return"datamaps-subunit "+a.id}).attr("data-info",function(a){return JSON.stringify(d[a.id])}).style("fill",function(b){var e,f=d[b.id];return f&&f.fillKey&&(e=c[a(f.fillKey,{data:d[b.id],geography:b})]),"undefined"==typeof e&&(e=a(f&&f.fillColor,c.defaultFill,{data:d[b.id],geography:b})),e}).style("stroke-width",e.borderWidth).style("stroke",e.borderColor)}function f(){function b(){this.parentNode.appendChild(this)}var c=this.svg,d=this,e=this.options.geographyConfig;(e.highlightOnHover||e.popupOnHover)&&c.selectAll(".datamaps-subunit").on("mouseover",function(f){var g=n.select(this),h=d.options.data[f.id]||{};if(e.highlightOnHover){var i={fill:g.style("fill"),stroke:g.style("stroke"),"stroke-width":g.style("stroke-width"),"fill-opacity":g.style("fill-opacity")};g.style("fill",a(h.highlightFillColor,e.highlightFillColor,h)).style("stroke",a(h.highlightBorderColor,e.highlightBorderColor,h)).style("stroke-width",a(h.highlightBorderWidth,e.highlightBorderWidth,h)).style("fill-opacity",a(h.highlightFillOpacity,e.highlightFillOpacity,h)).attr("data-previousAttributes",JSON.stringify(i)),/((MSIE)|(Trident))/.test(navigator.userAgent)||b.call(this)}e.popupOnHover&&d.updatePopup(g,f,e,c)}).on("mouseout",function(){var a=n.select(this);if(e.highlightOnHover){var b=JSON.parse(a.attr("data-previousAttributes"));for(var c in b)a.style(c,b[c])}a.on("mousemove",null),n.selectAll(".datamaps-hoverover").style("display","none")})}function g(a,b,c){if(b=b||{},this.options.fills){var d="<dl>",e="";b.legendTitle&&(d="<h2>"+b.legendTitle+"</h2>"+d);for(var f in this.options.fills){if("defaultFill"===f){if(!b.defaultFillName)continue;e=b.defaultFillName}else e=b.labels&&b.labels[f]?b.labels[f]:f+": ";d+="<dt>"+e+"</dt>",d+='<dd style="background-color:'+this.options.fills[f]+'">&nbsp;</dd>'}d+="</dl>";n.select(this.options.element).append("div").attr("class","datamaps-legend").html(d)}}function h(a,b){var c=n.geo.graticule();this.svg.insert("path",".datamaps-subunits").datum(c).attr("class","datamaps-graticule").attr("d",this.path)}function i(b,c,d){var e=this;this.svg;if(!c||c&&!c.slice)throw"Datamaps Error - arcs must be an array";for(var f=0;f<c.length;f++)c[f]=l(c[f],c[f].options),delete c[f].options;"undefined"==typeof d&&(d=p.arcConfig);var g=b.selectAll("path.datamaps-arc").data(c,JSON.stringify),h=n.geo.path().projection(e.projection);g.enter().append("svg:path").attr("class","datamaps-arc").style("stroke-linecap","round").style("stroke",function(b){return a(b.strokeColor,d.strokeColor,b)}).style("fill","none").style("stroke-width",function(b){return a(b.strokeWidth,d.strokeWidth,b)}).attr("d",function(b){var c=e.latLngToXY(a(b.origin.latitude,b),a(b.origin.longitude,b)),f=e.latLngToXY(a(b.destination.latitude,b),a(b.destination.longitude,b)),g=[(c[0]+f[0])/2,(c[1]+f[1])/2];if(d.greatArc){var i=n.geo.greatArc().source(function(b){return[a(b.origin.longitude,b),a(b.origin.latitude,b)]}).target(function(b){return[a(b.destination.longitude,b),a(b.destination.latitude,b)]});return h(i(b))}var j=a(b.arcSharpness,d.arcSharpness,b);return"M"+c[0]+","+c[1]+"S"+(g[0]+50*j)+","+(g[1]-75*j)+","+f[0]+","+f[1]}).transition().delay(100).style("fill",function(b){var c=this.getTotalLength();return this.style.transition=this.style.WebkitTransition="none",this.style.strokeDasharray=c+" "+c,this.style.strokeDashoffset=c,this.getBoundingClientRect(),this.style.transition=this.style.WebkitTransition="stroke-dashoffset "+a(b.animationSpeed,d.animationSpeed,b)+"ms ease-out",this.style.strokeDashoffset="0","none"}),g.exit().transition().style("opacity",0).remove()}function j(a,b){var c=this;b=b||{};var d=this.projection([-67.707617,42.722131]);this.svg.selectAll(".datamaps-subunit").attr("data-foo",function(e){var f=c.path.centroid(e),g=7.5,h=5;["FL","KY","MI"].indexOf(e.id)>-1&&(g=-2.5),"NY"===e.id&&(g=-1),"MI"===e.id&&(h=18),"LA"===e.id&&(g=13);var i,j;i=f[0]-g,j=f[1]+h;var k=["VT","NH","MA","RI","CT","NJ","DE","MD","DC"].indexOf(e.id);if(k>-1){var l=d[1];i=d[0],j=l+k*(2+(b.fontSize||12)),a.append("line").attr("x1",i-3).attr("y1",j-5).attr("x2",f[0]).attr("y2",f[1]).style("stroke",b.labelColor||"#000").style("stroke-width",b.lineWidth||1)}return a.append("text").attr("x",i).attr("y",j).style("font-size",(b.fontSize||10)+"px").style("font-family",b.fontFamily||"Verdana").style("fill",b.labelColor||"#000").text(e.id),"bar"})}function k(b,c,d){function e(a){return"undefined"!=typeof a&&"undefined"!=typeof a.latitude&&"undefined"!=typeof a.longitude}var f=this,g=this.options.fills,h=this.options.filters,i=this.svg;if(!c||c&&!c.slice)throw"Datamaps Error - bubbles must be an array";var j=b.selectAll("circle.datamaps-bubble").data(c,d.key);j.enter().append("svg:circle").attr("class","datamaps-bubble").attr("cx",function(a){var b;return e(a)?b=f.latLngToXY(a.latitude,a.longitude):a.centered&&(b=f.path.centroid(i.select("path."+a.centered).data()[0])),b?b[0]:void 0}).attr("cy",function(a){var b;return e(a)?b=f.latLngToXY(a.latitude,a.longitude):a.centered&&(b=f.path.centroid(i.select("path."+a.centered).data()[0])),b?b[1]:void 0}).attr("r",function(b){return d.animate?0:a(b.radius,d.radius,b)}).attr("data-info",function(a){return JSON.stringify(a)}).attr("filter",function(b){var c=h[a(b.filterKey,d.filterKey,b)];return c?c:void 0}).style("stroke",function(b){return a(b.borderColor,d.borderColor,b)}).style("stroke-width",function(b){return a(b.borderWidth,d.borderWidth,b)}).style("fill-opacity",function(b){return a(b.fillOpacity,d.fillOpacity,b)}).style("fill",function(b){var c=g[a(b.fillKey,d.fillKey,b)];return c||g.defaultFill}).on("mouseover",function(b){var c=n.select(this);if(d.highlightOnHover){var e={fill:c.style("fill"),stroke:c.style("stroke"),"stroke-width":c.style("stroke-width"),"fill-opacity":c.style("fill-opacity")};c.style("fill",a(b.highlightFillColor,d.highlightFillColor,b)).style("stroke",a(b.highlightBorderColor,d.highlightBorderColor,b)).style("stroke-width",a(b.highlightBorderWidth,d.highlightBorderWidth,b)).style("fill-opacity",a(b.highlightFillOpacity,d.highlightFillOpacity,b)).attr("data-previousAttributes",JSON.stringify(e))}d.popupOnHover&&f.updatePopup(c,b,d,i)}).on("mouseout",function(a){var b=n.select(this);if(d.highlightOnHover){var c=JSON.parse(b.attr("data-previousAttributes"));for(var e in c)b.style(e,c[e])}n.selectAll(".datamaps-hoverover").style("display","none")}),j.transition().duration(400).attr("r",function(b){return a(b.radius,d.radius,b)}),j.exit().transition().delay(d.exitDelay).attr("r",0).remove()}function l(a){return Array.prototype.slice.call(arguments,1).forEach(function(b){if(b)for(var c in b)null==a[c]&&(a[c]=b[c])}),a}function m(a){if("undefined"==typeof n||"undefined"==typeof o)throw new Error("Include d3.js (v3.0.3 or greater) and topojson on this page before creating a new map");return this.options=l(a,p),this.options.geographyConfig=l(a.geographyConfig,p.geographyConfig),this.options.projectionConfig=l(a.projectionConfig,p.projectionConfig),this.options.bubblesConfig=l(a.bubblesConfig,p.bubblesConfig),this.options.arcConfig=l(a.arcConfig,p.arcConfig),n.select(this.options.element).select("svg").length>0&&b.call(this,this.options.element,this.options.height,this.options.width),this.addPlugin("bubbles",k),this.addPlugin("legend",g),this.addPlugin("arc",i),this.addPlugin("labels",j),this.addPlugin("graticule",h),this.options.disableDefaultStyles||d(),this.draw()}var n=window.d3,o=window.topojson,p={scope:"world",responsive:!1,aspectRatio:.5625,setProjection:c,projection:"equirectangular",dataType:"json",data:{},done:function(){},fills:{defaultFill:"#ABDDA4"},filters:{},geographyConfig:{dataUrl:null,hideAntarctica:!0,hideHawaiiAndAlaska:!1,borderWidth:1,borderColor:"#FDFDFD",popupTemplate:function(a,b){return'<div class="hoverinfo"><strong>'+a.properties.name+"</strong></div>"},popupOnHover:!0,highlightOnHover:!0,highlightFillColor:"#FC8D59",highlightBorderColor:"rgba(250, 15, 160, 0.2)",highlightBorderWidth:2},projectionConfig:{rotation:[97,0]},bubblesConfig:{borderWidth:2,borderColor:"#FFFFFF",popupOnHover:!0,radius:null,popupTemplate:function(a,b){return'<div class="hoverinfo"><strong>'+b.name+"</strong></div>"},fillOpacity:.75,animate:!0,highlightOnHover:!0,highlightFillColor:"#FC8D59",highlightBorderColor:"rgba(250, 15, 160, 0.2)",highlightBorderWidth:2,highlightFillOpacity:.85,exitDelay:100,key:JSON.stringify},arcConfig:{strokeColor:"#DD1C77",strokeWidth:1,arcSharpness:1,animationSpeed:600}};m.prototype.resize=function(){var a=this,b=a.options;if(b.responsive){var c=b.element.clientWidth,d=n.select(b.element).select("svg").attr("data-width");n.select(b.element).select("svg").selectAll("g").attr("transform","scale("+c/d+")")}},m.prototype.draw=function(){function a(a){b.options.dataUrl&&n[b.options.dataType](b.options.dataUrl,function(a){if("csv"===b.options.dataType&&a&&a.slice){for(var c={},d=0;d<a.length;d++)c[a[d].id]=a[d];a=c}Datamaps.prototype.updateChoropleth.call(b,a)}),e.call(b,a),f.call(b),(b.options.geographyConfig.popupOnHover||b.options.bubblesConfig.popupOnHover)&&(hoverover=n.select(b.options.element).append("div").attr("class","datamaps-hoverover").style("z-index",10001).style("position","absolute")),b.options.done(b)}var b=this,c=b.options,d=c.setProjection.apply(b,[c.element,c]);return this.path=d.path,this.projection=d.projection,c.geographyConfig.dataUrl?n.json(c.geographyConfig.dataUrl,function(c,d){if(c)throw new Error(c);b.customTopo=d,a(d)}):a(this[c.scope+"Topo"]||c.geographyConfig.dataJson),this},m.prototype.worldTopo="__WORLD__",m.prototype.abwTopo="__ABW__",m.prototype.afgTopo="__AFG__",m.prototype.agoTopo="__AGO__",m.prototype.aiaTopo="__AIA__",m.prototype.albTopo="__ALB__",m.prototype.aldTopo="__ALD__",m.prototype.andTopo="__AND__",m.prototype.areTopo="__ARE__",m.prototype.argTopo="__ARG__",m.prototype.armTopo="__ARM__",m.prototype.asmTopo="__ASM__",m.prototype.ataTopo="__ATA__",m.prototype.atcTopo="__ATC__",m.prototype.atfTopo="__ATF__",m.prototype.atgTopo="__ATG__",m.prototype.ausTopo="__AUS__",m.prototype.autTopo="__AUT__",m.prototype.azeTopo="__AZE__",m.prototype.bdiTopo="__BDI__",m.prototype.belTopo="__BEL__",m.prototype.benTopo="__BEN__",m.prototype.bfaTopo="__BFA__",m.prototype.bgdTopo="__BGD__",m.prototype.bgrTopo="__BGR__",m.prototype.bhrTopo="__BHR__",m.prototype.bhsTopo="__BHS__",m.prototype.bihTopo="__BIH__",m.prototype.bjnTopo="__BJN__",m.prototype.blmTopo="__BLM__",m.prototype.blrTopo="__BLR__",m.prototype.blzTopo="__BLZ__",m.prototype.bmuTopo="__BMU__",m.prototype.bolTopo="__BOL__",m.prototype.braTopo="__BRA__",m.prototype.brbTopo="__BRB__",m.prototype.brnTopo="__BRN__",m.prototype.btnTopo="__BTN__",m.prototype.norTopo="__NOR__",m.prototype.bwaTopo="__BWA__",m.prototype.cafTopo="__CAF__",m.prototype.canTopo="__CAN__",m.prototype.cheTopo="__CHE__",m.prototype.chlTopo="__CHL__",m.prototype.chnTopo="__CHN__",m.prototype.civTopo="__CIV__",m.prototype.clpTopo="__CLP__",m.prototype.cmrTopo="__CMR__",m.prototype.codTopo="__COD__",m.prototype.cogTopo="__COG__",m.prototype.cokTopo="__COK__",m.prototype.colTopo="__COL__",m.prototype.comTopo="__COM__",m.prototype.cpvTopo="__CPV__",m.prototype.criTopo="__CRI__",m.prototype.csiTopo="__CSI__",m.prototype.cubTopo="__CUB__",m.prototype.cuwTopo="__CUW__",m.prototype.cymTopo="__CYM__",m.prototype.cynTopo="__CYN__",m.prototype.cypTopo="__CYP__",m.prototype.czeTopo="__CZE__",m.prototype.deuTopo="__DEU__",m.prototype.djiTopo="__DJI__",m.prototype.dmaTopo="__DMA__",m.prototype.dnkTopo="__DNK__",m.prototype.domTopo={type:"Topology",objects:{dom:{type:"GeometryCollection",geometries:[{type:"Polygon",properties:{name:"Santiago"},id:"DO.ST",arcs:[[0,1,2,3,4,5]]},{type:"Polygon",properties:{name:"Santiago Rodríguez"},id:"DO.SR",arcs:[[6,-4,7,8,9,10]]},{type:"Polygon",properties:{name:"Valverde"},id:"DO.VA",arcs:[[-5,-7,11,12]]},{type:"Polygon",properties:{name:"San Juan"},id:"DO.JU",arcs:[[-3,13,14,15,16,-8]]},{type:"Polygon",properties:{name:"Santo Domingo"},id:"DO.SD",arcs:[[17,18,19,20,21,22]]},{type:"Polygon",properties:{name:"Sánchez Ramírez"},id:"DO.SZ",arcs:[[23,24,25,26]]},{type:"Polygon",properties:{name:"San Pedro de Macorís"},id:"DO.PM",arcs:[[27,28,29,-18,30,31]]},{type:"Polygon",properties:{name:"Monte Cristi"},id:"DO.MC",arcs:[[32,-12,-11,33,34]]},{type:"Polygon",properties:{name:"Puerto Plata"},id:"DO.PP",arcs:[[35,-6,-13,-33,36]]},{type:"Polygon",properties:{name:"Dajabón"},id:"DO.DA",arcs:[[-10,37,38,-34]]},{type:"Polygon",properties:{name:"Espaillat"},id:"DO.ES",arcs:[[39,40,41,42,-1,-36,43]]},{type:"Polygon",properties:{name:"Hermanas"},id:"DO.",arcs:[[44,45,-42]]},{type:"Polygon",properties:{name:"Bahoruco"},id:"DO.BR",arcs:[[46,47,48,-16]]},{type:"Polygon",properties:{name:"Barahona"},id:"DO.BH",arcs:[[49,50,51,52,-48]]},{type:"Polygon",properties:{name:"Independencia"},id:"DO.IN",arcs:[[-49,-53,53,54,55]]},{type:"Polygon",properties:{name:"La Estrelleta"},id:"DO.EP",arcs:[[-17,-56,56,-38,-9]]},{type:"MultiPolygon",properties:{name:"Pedernales"},id:"DO.PN",arcs:[[[57]],[[58,-54,-52]]]},{type:"Polygon",properties:{name:"Azua"},id:"DO.AZ",arcs:[[59,60,61,-50,-47,-15,62]]},{type:"Polygon",properties:{name:"La Vega"},id:"DO.VE",arcs:[[-46,63,-26,64,65,-63,-14,-2,-43]]},{type:"Polygon",properties:{name:"Monseñor Nouel"},id:"DO.MN",arcs:[[-25,66,67,68,-65]]},{type:"Polygon",properties:{name:"Peravia"},id:"DO.PV",arcs:[[69,-61,70,71]]},{type:"Polygon",properties:{name:"San José de Ocoa"},id:"DO.JO",arcs:[[72,-71,-60,-66,-69]]},{type:"Polygon",properties:{name:"Duarte"},id:"DO.DU",arcs:[[73,74,75,-27,-64,-45,-41]]},{type:"Polygon",properties:{name:"Hato Mayor"},id:"DO.HM",arcs:[[76,-32,77,78,79]]},{type:"Polygon",properties:{name:"Monte Plata"},id:"DO.MP",arcs:[[80,-78,-31,-23,81,-67,-24,-76]]},{type:"Polygon",properties:{name:"María Trinidad Sánchez"},id:"DO.MT",arcs:[[82,-74,-40,83]]},{type:"Polygon",properties:{name:"Samaná"},id:"DO.SM",arcs:[[-79,-81,-75,-83,84]]},{type:"Polygon",properties:{name:"San Cristóbal"},id:"DO.CR",arcs:[[-22,85,-72,-73,-68,-82]]},{type:"Polygon",properties:{name:"Distrito Nacional"},id:"DO.NC",arcs:[[86,-20]]},{type:"Polygon",properties:{name:"El Seybo"},id:"DO.SE",arcs:[[87,88,-28,-77,89]]},{type:"MultiPolygon",properties:{name:"La Altagracia"},id:"DO.AL",arcs:[[[90]],[[91,-88,92]]]},{type:"Polygon",properties:{name:"La Romana"},id:"DO.RO",arcs:[[93,-29,-89,-92]]}]}},arcs:[[[3971,8244],[-11,-85],[-41,-66],[-37,-89],[-15,-105],[7,-95],[0,-92],[-42,-47],[-40,-44]],[[3792,7621],[-144,-68],[-136,-105],[-67,-27],[-20,-85],[66,-73],[83,-34],[43,-110],[-20,-142],[8,-120],[-71,20],[-59,-5],[-33,-112],[-142,-157],[-169,-120],[-89,-56],[-80,-57],[20,-89],[-11,-93]],[[2971,6188],[-71,32],[-70,33],[-67,-22],[-62,-44],[-123,55],[-121,114],[-51,68],[-8,103],[-24,62],[-45,34],[-111,80],[-102,88]],[[2116,6791],[14,131],[-3,127],[-45,62],[-10,88],[8,129],[9,127],[38,76],[49,60],[34,56],[42,41],[51,-8],[51,4],[98,68],[104,52],[-23,41],[-36,37],[6,83],[36,71]],[[2539,8036],[75,-61],[79,-49],[40,-13],[39,8],[26,54],[24,44],[112,-70],[120,1],[11,74],[-62,68],[18,121],[3,115],[-40,36],[-40,28],[-21,75],[-5,84],[67,-70],[70,14],[39,127],[18,140]],[[3112,8762],[85,-29],[75,-31],[61,-76],[61,-79],[121,9],[10,245],[145,-93],[56,-200],[80,-188],[165,-76]],[[2243,8322],[96,-234],[200,-52]],[[2116,6791],[-145,2],[-117,85]],[[1854,6878],[-120,93],[-121,89],[-84,163],[-112,106]],[[1417,7329],[-46,73],[-27,90],[133,87],[33,265],[20,88],[-6,95],[34,176],[63,153]],[[1621,8356],[36,67],[47,-51],[82,-45],[88,11],[53,39],[58,11],[85,-72],[85,-12],[41,41],[47,-23]],[[2243,8322],[31,144],[-17,152],[17,89],[66,-10],[-7,139],[-8,138],[24,125],[30,123]],[[2379,9222],[93,-48],[88,-63],[60,-67],[73,-28],[111,-50],[91,-107],[103,-75],[114,-22]],[[2971,6188],[44,-67],[23,-90]],[[3038,6031],[-22,-89],[-57,-41],[-11,-81],[-38,-54],[-67,-68],[-33,-105],[-18,-207],[-1,-215],[-22,-71],[-37,-52],[-39,23],[-23,73],[-88,-41],[17,-157],[-4,-53],[-28,-57],[18,-45],[6,-54],[-51,-36],[-44,-24],[-72,-156],[-119,-47]],[[2305,4474],[-99,81],[-129,-56],[-75,-19],[-75,12],[-62,-31],[-59,-55],[-132,15],[-122,90],[-134,40],[-128,69]],[[1290,4620],[38,133],[-31,119],[-73,25],[-51,78],[0,103],[-19,96],[-55,71],[-62,58],[33,203],[-47,88],[23,226],[67,208],[60,80],[77,11],[84,36],[42,132],[32,179],[55,150],[92,-21],[86,-76],[103,9],[85,95],[6,129],[19,126]],[[6613,4609],[-34,-54],[-16,-65],[15,-2],[15,10],[12,-105],[-5,-104],[-56,-106],[-43,-110],[107,-168],[160,-47],[-18,-133],[-9,-110]],[[6741,3615],[-141,142],[-60,47],[-40,7],[-17,-39],[1,-47],[5,-47],[-7,-38],[-25,-12],[-38,0],[-35,10],[-15,15],[-46,114],[-22,31],[-20,9],[-418,67],[-76,-5]],[[5787,3869],[4,125],[-76,16],[-51,-20],[-51,7],[-34,77],[-33,69],[-73,-60],[-7,-119],[61,-131],[-16,-151]],[[5511,3682],[-34,-16],[-29,-21]],[[5448,3645],[-10,26],[-2,90],[-35,75],[-61,3],[-61,-3],[-31,50],[-8,71],[-50,90],[-67,73],[-50,134],[-29,147],[13,103],[24,93],[-74,174],[-2,187]],[[5005,4958],[77,-40],[49,-131],[87,-47],[89,-36],[128,-36],[116,78],[7,38],[12,38],[32,15],[35,3],[63,-4],[63,-5],[73,-85],[62,-102],[38,-72],[15,-83],[57,-81],[22,-118],[125,192],[158,85],[59,19],[51,48],[92,29],[98,-54]],[[5676,6244],[-41,-269],[-47,-272],[-76,-86],[-88,64],[-55,14],[-33,-73],[-48,11],[-57,17],[-72,-26],[-52,-67],[-115,-41],[-141,-44]],[[4851,5472],[-71,180],[-116,121],[-57,61],[-43,83],[-8,61],[-25,46],[-69,49],[-13,113],[-24,97],[-31,99]],[[4394,6382],[76,129],[108,75],[67,50],[60,33],[-5,11],[-5,12]],[[4695,6692],[-2,17],[-8,-3],[50,24],[53,-21],[57,-15],[56,14],[120,3],[119,-20],[77,-8],[71,-47],[61,-42],[64,-29],[84,-1],[88,-9],[67,-31],[58,-54],[-10,-111],[-24,-115]],[[7487,4576],[35,-39],[37,-33],[46,7],[44,-18],[66,-106],[78,-83],[85,17],[80,-12],[-14,-96],[-20,-109]],[[7924,4104],[-44,-106],[-35,-110],[18,-56],[33,-40],[33,-121],[17,-116]],[[7946,3555],[-3,-1],[-51,14],[-119,59],[-54,13],[-47,22],[-79,98],[-60,23],[-52,-16],[-53,-27],[-54,-5],[-55,48],[-56,-77],[-353,-40],[-106,-57],[-55,-2],[-8,8]],[[6613,4609],[155,398],[160,247]],[[6928,5254],[0,-145],[49,-132],[15,-173],[19,-170],[62,-138],[62,-138],[38,-140],[42,-137],[77,133],[58,111],[44,156],[93,95]],[[2141,9568],[18,-142],[54,-121],[85,-36],[81,-47]],[[1621,8356],[-112,77],[-103,99],[-41,109],[-68,29],[-286,-52],[-264,163],[-30,11]],[[717,8792],[2,67],[-9,74],[-24,115],[52,-17],[48,-36],[-10,82],[-48,162],[3,41],[0,31],[-73,6],[-9,44],[29,66],[43,68],[12,13],[14,4],[30,-1],[19,11],[30,54],[16,21],[32,19],[25,8],[23,17],[31,41],[-18,53],[-3,47],[14,33],[35,13],[21,-5],[33,-21],[21,-5],[9,9],[18,39],[10,9],[279,31],[71,-15],[70,-36],[260,-196],[76,-23],[72,41],[55,-58],[39,-26],[120,-6],[6,2]],[[4447,9065],[-29,-119],[-41,-111],[-45,-21],[-49,1],[-48,-19],[-48,-9],[-35,12],[-35,0],[-43,-56],[-20,-83],[-22,-221],[-61,-195]],[[2141,9568],[26,11],[7,32],[2,42],[14,44],[32,18],[23,-39],[30,-110],[21,19],[16,20],[12,24],[7,27],[-23,11],[-5,5],[-1,11],[-8,28],[42,-24],[36,3],[36,13],[44,8],[28,31],[50,138],[33,31],[42,15],[88,64],[48,9],[43,-16],[42,-36],[23,-53],[-14,-66],[52,-31],[20,0],[-13,64],[-7,24],[132,-31],[38,5],[81,28],[31,-2],[33,-33],[120,-208],[9,-39],[-14,-39],[102,-1],[39,-28],[104,-127],[98,-73],[105,-53],[121,-27],[164,-2],[14,12],[14,28],[33,33],[37,28],[27,13],[106,-49],[166,-255]],[[1417,7329],[-47,-71],[-55,-49],[-65,32],[-66,26],[-34,-58],[-20,-77],[-57,-31],[-55,-48],[-45,-63]],[[973,6990],[-176,125],[-90,134],[-11,17],[-49,99],[-13,83],[18,27],[73,61],[26,29],[34,128],[15,24],[31,96],[2,186],[-32,327],[-76,262],[-13,95],[5,109]],[[5204,8741],[1,-25],[-50,-218],[-134,-114],[-64,7],[-58,-6],[-16,-107],[-8,-119]],[[4875,8159],[-29,8],[-29,-1]],[[4817,8166],[-62,147],[-79,101],[-81,-68],[-56,-118],[-64,-64],[-32,112],[-45,32],[-50,26],[-90,-163],[1,-279],[-11,-235],[-58,-245]],[[4190,7412],[-77,-22],[-54,201],[-56,-18],[-61,-35],[-86,13],[-64,70]],[[4447,9065],[99,-153],[45,-47],[50,-37],[55,-24],[124,-19],[100,-53],[182,-52],[41,1],[27,15],[24,30],[10,15]],[[4817,8166],[-17,-106],[-21,-134],[-78,-96],[-114,-81],[-53,-176],[-22,-196],[-38,-179],[-3,-178]],[[4471,7020],[-111,11],[-76,107],[-54,133],[-40,141]],[[2305,4474],[129,-191],[169,-86],[86,-22],[72,-71],[-1,-74],[-57,-32]],[[2703,3998],[-54,100],[-36,-109],[-42,-103],[-70,-75],[-84,-44],[-43,-53],[-31,-69],[-44,-44],[-46,-42],[-47,-110],[-8,-135]],[[2198,3314],[-98,-10],[-76,91],[-70,194],[-130,12],[-104,-60],[-106,39],[-98,89],[-104,69],[-279,160],[-76,364],[31,88],[18,94],[-4,53],[13,47],[87,40],[88,36]],[[2703,3998],[27,-68],[9,-133],[-55,-105],[-83,-105],[13,-48],[13,-48],[26,-29],[34,-19],[87,-36],[79,-28],[-6,-60],[9,-89],[21,-135],[-41,-100]],[[2836,2995],[-17,34],[-14,42],[-18,37],[-28,31],[-29,19],[-118,37],[-55,2],[-42,-25],[-17,-64],[-6,-35],[-24,-61],[-6,-47],[5,-53],[14,-30],[18,-26],[19,-46],[44,-228],[15,-39],[0,-50],[-53,-117],[-45,-168],[-257,-552],[-23,-94],[-11,-34],[-26,-26],[-54,-41],[-33,-42],[-24,-41],[-18,-50],[-17,-70],[-21,11],[-7,7],[-8,10]],[[1980,1286],[-2,11],[0,162],[-44,146],[-81,6],[-69,-25],[-134,163],[-58,213],[19,37],[28,15],[27,16],[15,45],[5,75],[-2,77],[-4,170],[-83,71]],[[1597,2468],[12,113],[49,78],[69,-28],[63,12],[-43,230],[-40,239],[120,38],[137,-68],[144,56],[90,176]],[[1597,2468],[-81,100],[-78,107],[-94,56],[-99,36],[-232,168],[-224,186],[-6,3]],[[783,3124],[1,4],[32,81],[-6,12],[-25,33],[-38,37],[-146,81],[-103,100],[-22,37],[-41,89],[-23,30],[-106,39],[-41,33],[-16,77],[10,46],[21,17],[14,23],[-7,63],[-17,40],[-246,368],[-24,69],[47,51],[101,31],[204,-55],[105,53],[35,55],[56,140],[37,60],[7,7],[19,17]],[[611,4762],[151,-27],[183,-41],[174,-20],[171,-54]],[[611,4762],[73,66],[38,45],[32,78],[19,71],[13,77],[4,79],[-22,164],[-2,169],[-15,78],[-21,37],[-62,84],[-25,42],[-38,119],[-25,29],[-63,3],[-68,-34],[-49,-11],[-8,73],[47,46],[140,55],[35,32],[118,191],[81,166],[41,54],[92,96],[35,74],[14,72],[12,249],[-34,24]],[[1365,24],[-47,-24],[-45,38],[-1,90],[25,105],[31,84],[38,-32],[39,-42],[69,-98],[-42,-19],[-67,-102]],[[1980,1286],[-3,3],[-4,-30],[-5,-11],[-10,-13],[19,0],[-11,-35],[-14,-27],[-18,-18],[-21,-6],[-10,-17],[-18,-83],[-10,-31],[-33,-70],[-92,-393],[-28,-76],[-112,-231],[-28,18],[-23,33],[-1,18],[-27,33],[-187,453],[-45,73],[-91,52],[-217,-43],[-93,33],[26,30],[87,132],[18,54],[-4,90],[-11,63],[-42,119],[-29,66],[-6,24],[-2,50],[18,158],[-20,73],[-47,82],[-100,120],[-151,85],[32,126],[10,72],[-6,122],[2,69],[-7,47],[-29,120],[-4,39],[7,83],[22,78],[121,304]],[[3558,4729],[78,-225],[57,-212],[40,-36],[20,-62],[48,-67],[63,-32],[90,-87],[88,-66],[56,-142],[60,-173]],[[4158,3627],[18,-77],[-27,-77],[-21,-112],[7,-119],[-98,-164],[-151,-42],[-1,0]],[[3885,3036],[-35,33],[-12,39],[7,42],[16,19],[18,14],[15,29],[12,84],[2,88],[-8,78],[-15,50],[-59,109],[-36,38],[-63,35],[-54,19],[-68,7],[-58,-23],[-24,-73],[9,-87],[-7,-35],[-80,-117],[-23,-21],[-29,-12],[-32,2],[-56,26],[-25,3],[-21,-12],[-38,-39],[-25,-9],[-35,7],[-12,-11],[-27,-37],[-7,-16],[-17,-51],[-4,-19],[-7,-16],[-36,-18],[-14,-10],[-72,-126],[-39,-33],[-64,-12],[-26,14]],[[3038,6031],[143,-142],[31,-385],[115,-230],[166,-123],[103,-183],[-38,-239]],[[4471,7020],[88,-198],[136,-130]],[[4394,6382],[-21,108],[-65,57],[-53,-28],[-30,-78],[-129,-51],[-56,-154],[-3,-286],[-162,-195],[-25,-289],[160,-273]],[[4010,5193],[-39,-185],[-71,-132],[-57,-77],[-42,-68],[-120,2],[-123,-4]],[[4851,5472],[-56,-91],[-18,-130]],[[4777,5251],[-93,-66],[-39,-119],[-36,-159],[-101,3]],[[4508,4910],[-69,71],[-73,43],[-65,-35],[-68,-10],[-109,117],[-114,97]],[[4969,2878],[-59,-2],[-51,-13],[-33,-27],[-48,43],[-51,16],[-348,-2],[-58,-27],[-112,-93],[-63,-20],[-189,0],[-43,26],[-4,36],[20,28],[25,24],[13,26],[-8,45],[-18,25],[-20,16],[-20,41],[-17,16]],[[4158,3627],[73,159],[133,57],[68,69],[59,92]],[[4491,4004],[131,-83],[107,-152],[86,-59],[-5,-101],[-70,-60],[-14,-108],[51,-93],[54,-94],[19,-54],[20,-52],[36,-51],[35,-44],[11,-94],[17,-81]],[[4508,4910],[-50,-170],[-10,-181],[12,-147],[-30,-148],[20,-135],[41,-125]],[[4875,8159],[96,-86],[92,-91],[32,-132],[8,-144],[34,-176],[94,-100],[83,-16],[37,-97],[132,-163],[186,-68],[183,-126],[188,-53]],[[6040,6907],[133,93],[164,-57],[0,-114],[-72,-70],[-43,-41],[-36,-67],[-10,-131],[-54,-74]],[[6122,6446],[-178,10],[-145,-25],[-6,-47],[-3,-65],[-41,-79],[-73,4]],[[7600,6167],[-1,-15],[0,-1],[-13,-229],[75,-197],[-224,77],[-154,-40],[97,-291],[156,-236],[42,-168],[-12,-178],[-47,-159],[-32,-154]],[[6928,5254],[49,98],[56,86],[56,51],[52,52],[-50,74],[-99,18],[-133,107],[-136,99],[-155,114],[-125,164]],[[6443,6117],[36,119],[16,127],[-8,112],[2,31]],[[6489,6506],[34,-36],[149,34],[52,-28],[65,30],[128,-72],[67,11],[-17,21],[-21,19],[-26,14],[-30,5],[0,29],[145,11],[42,-11],[48,-52],[37,-128],[46,-51],[47,-18],[93,-17],[252,-100]],[[6122,6446],[78,-87],[78,-85],[86,-71],[79,-86]],[[5005,4958],[-66,71],[-70,58],[-47,80],[-45,84]],[[6080,7347],[-6,-21],[-10,-112],[-25,-105],[-17,-103],[18,-99]],[[5204,8741],[89,140],[52,34],[150,-3],[74,10],[33,-6],[42,-35],[92,-143],[30,-97],[-2,-106],[-45,-230],[55,-34],[20,-74],[0,-191],[6,-83],[18,-66],[181,-394],[81,-116]],[[6080,7347],[10,-15],[93,-55],[55,14],[106,59],[54,13],[122,7],[54,17],[56,33],[80,78],[31,10],[28,-9],[58,-41],[36,-9],[65,24],[29,4],[16,-1],[14,-5],[11,-13],[5,-24],[8,-20],[19,8],[30,27],[157,-94],[47,-49],[31,91],[49,67],[124,99],[79,35],[19,-48],[-21,-100],[-40,-118],[54,-29],[61,0],[60,23],[49,37],[16,-92],[-35,-72],[-49,-65],[-25,-72],[-11,-76],[-32,-68],[-47,-50],[-60,-21],[-213,57],[-233,-26],[-55,23],[-101,73],[-346,63],[-39,-16],[-15,-56],[-9,-199],[-20,-170],[8,-63],[26,-27]],[[5448,3645],[-34,-26],[-61,-79],[-45,-105],[-18,-126],[-15,-34],[-62,-48],[-14,-31],[-11,-46],[-92,-125],[-66,-111],[-37,-47],[-17,11],[-7,0]],[[5787,3869],[-12,-1],[-44,-19],[-85,-60],[-70,-70],[-27,-19],[-38,-18]],[[8759,5995],[-51,-96],[-77,-88],[1,-57],[-15,-45],[-21,-176],[74,-206],[-57,-236],[-139,-162],[-72,-17],[-61,-53],[-10,-90],[20,-87]],[[8351,4682],[-119,-68],[-68,-193],[-104,-193],[-136,-124]],[[7600,6167],[105,-41],[43,4],[51,43],[-17,30],[-34,30],[0,40],[48,21],[43,-57],[57,-135],[37,-31],[41,-18],[35,-23],[18,-45],[33,39],[66,45],[31,33],[-20,34],[10,8],[24,1],[23,12],[29,43],[8,17],[11,1],[98,-8],[56,-16],[51,-27],[46,-37],[5,-11],[0,-15],[2,-16],[11,-14],[56,-29],[5,1],[97,-29],[61,-4],[24,-13],[5,-5]],[[8961,2633],[127,-26],[140,6],[37,-19],[28,-53],[30,-82],[20,-76],[-5,-33],[-41,14],[-88,59],[-45,13],[-49,-9],[-84,-39],[-46,-9],[-95,37],[-68,90],[-44,113],[-24,103],[40,17],[48,-13],[47,-34],[41,-43],[31,-16]],[[8444,3587],[48,170],[48,190],[37,120],[-3,131],[-57,104],[-68,91],[-53,139],[-45,150]],[[8759,5995],[22,-23],[25,-20],[48,-6],[28,-15],[316,-429],[116,-206],[164,-183],[117,-119],[34,-22],[17,-17],[123,-173],[155,-138],[75,-167],[-15,-164],[-255,-569],[-18,-23],[-18,-28],[-8,-40],[5,-145],[-5,-42],[-31,-71],[-45,-33],[-56,-10],[-65,0],[-49,24],[-108,104],[-39,17],[-45,-44],[7,-67],[15,-79],[-24,-82],[-33,-65],[-21,-76],[-42,-243],[-15,-43],[-31,-17],[-230,-27],[-46,25],[-7,153],[-66,202],[-90,197],[-80,135],[-85,87],[-55,34]],[[8444,3587],[-58,36],[-114,24],[-131,-79],[-195,-13]]],transform:{scale:[.00036816030983098197,.00023923697709770723],translate:[-72.0098376059999,17.545558986000074]}},m.prototype.dzaTopo="__DZA__",m.prototype.ecuTopo="__ECU__",m.prototype.egyTopo="__EGY__",m.prototype.eriTopo="__ERI__",m.prototype.esbTopo="__ESB__",m.prototype.espTopo="__ESP__",m.prototype.estTopo="__EST__",m.prototype.ethTopo="__ETH__",m.prototype.finTopo="__FIN__",m.prototype.fjiTopo="__FJI__",m.prototype.flkTopo="__FLK__",m.prototype.fraTopo="__FRA__",m.prototype.froTopo="__FRO__",m.prototype.fsmTopo="__FSM__",m.prototype.gabTopo="__GAB__",m.prototype.psxTopo="__PSX__",m.prototype.gbrTopo="__GBR__",m.prototype.geoTopo="__GEO__",m.prototype.ggyTopo="__GGY__",m.prototype.ghaTopo="__GHA__",m.prototype.gibTopo="__GIB__",m.prototype.ginTopo="__GIN__",m.prototype.gmbTopo="__GMB__",m.prototype.gnbTopo="__GNB__",m.prototype.gnqTopo="__GNQ__",m.prototype.grcTopo="__GRC__",m.prototype.grdTopo="__GRD__",m.prototype.grlTopo="__GRL__",m.prototype.gtmTopo="__GTM__",m.prototype.gumTopo="__GUM__",m.prototype.guyTopo="__GUY__",m.prototype.hkgTopo="__HKG__",m.prototype.hmdTopo="__HMD__",m.prototype.hndTopo="__HND__",m.prototype.hrvTopo="__HRV__",m.prototype.htiTopo="__HTI__",m.prototype.hunTopo="__HUN__",m.prototype.idnTopo="__IDN__",m.prototype.imnTopo="__IMN__",m.prototype.indTopo="__IND__",m.prototype.ioaTopo="__IOA__",m.prototype.iotTopo="__IOT__",m.prototype.irlTopo="__IRL__",m.prototype.irnTopo="__IRN__",m.prototype.irqTopo="__IRQ__",m.prototype.islTopo="__ISL__",m.prototype.isrTopo="__ISR__",m.prototype.itaTopo="__ITA__",m.prototype.jamTopo="__JAM__",m.prototype.jeyTopo="__JEY__",m.prototype.jorTopo="__JOR__",m.prototype.jpnTopo="__JPN__",m.prototype.kabTopo="__KAB__",m.prototype.kasTopo="__KAS__",m.prototype.kazTopo="__KAZ__",m.prototype.kenTopo="__KEN__",m.prototype.kgzTopo="__KGZ__",m.prototype.khmTopo="__KHM__",m.prototype.kirTopo="__KIR__",m.prototype.knaTopo="__KNA__",m.prototype.korTopo="__KOR__",m.prototype.kosTopo="__KOS__",
m.prototype.kwtTopo="__KWT__",m.prototype.laoTopo="__LAO__",m.prototype.lbnTopo="__LBN__",m.prototype.lbrTopo="__LBR__",m.prototype.lbyTopo="__LBY__",m.prototype.lcaTopo="__LCA__",m.prototype.lieTopo="__LIE__",m.prototype.lkaTopo="__LKA__",m.prototype.lsoTopo="__LSO__",m.prototype.ltuTopo="__LTU__",m.prototype.luxTopo="__LUX__",m.prototype.lvaTopo="__LVA__",m.prototype.macTopo="__MAC__",m.prototype.mafTopo="__MAF__",m.prototype.marTopo="__MAR__",m.prototype.mcoTopo="__MCO__",m.prototype.mdaTopo="__MDA__",m.prototype.mdgTopo="__MDG__",m.prototype.mdvTopo="__MDV__",m.prototype.mexTopo="__MEX__",m.prototype.mhlTopo="__MHL__",m.prototype.mkdTopo="__MKD__",m.prototype.mliTopo="__MLI__",m.prototype.mltTopo="__MLT__",m.prototype.mmrTopo="__MMR__",m.prototype.mneTopo="__MNE__",m.prototype.mngTopo="__MNG__",m.prototype.mnpTopo="__MNP__",m.prototype.mozTopo="__MOZ__",m.prototype.mrtTopo="__MRT__",m.prototype.msrTopo="__MSR__",m.prototype.musTopo="__MUS__",m.prototype.mwiTopo="__MWI__",m.prototype.mysTopo="__MYS__",m.prototype.namTopo="__NAM__",m.prototype.nclTopo="__NCL__",m.prototype.nerTopo="__NER__",m.prototype.nfkTopo="__NFK__",m.prototype.ngaTopo="__NGA__",m.prototype.nicTopo="__NIC__",m.prototype.niuTopo="__NIU__",m.prototype.nldTopo="__NLD__",m.prototype.nplTopo="__NPL__",m.prototype.nruTopo="__NRU__",m.prototype.nulTopo="__NUL__",m.prototype.nzlTopo="__NZL__",m.prototype.omnTopo="__OMN__",m.prototype.pakTopo="__PAK__",m.prototype.panTopo="__PAN__",m.prototype.pcnTopo="__PCN__",m.prototype.perTopo="__PER__",m.prototype.pgaTopo="__PGA__",m.prototype.phlTopo="__PHL__",m.prototype.plwTopo="__PLW__",m.prototype.pngTopo="__PNG__",m.prototype.polTopo="__POL__",m.prototype.priTopo="__PRI__",m.prototype.prkTopo="__PRK__",m.prototype.prtTopo="__PRT__",m.prototype.pryTopo="__PRY__",m.prototype.pyfTopo="__PYF__",m.prototype.qatTopo="__QAT__",m.prototype.rouTopo="__ROU__",m.prototype.rusTopo="__RUS__",m.prototype.rwaTopo="__RWA__",m.prototype.sahTopo="__SAH__",m.prototype.sauTopo="__SAU__",m.prototype.scrTopo="__SCR__",m.prototype.sdnTopo="__SDN__",m.prototype.sdsTopo="__SDS__",m.prototype.senTopo="__SEN__",m.prototype.serTopo="__SER__",m.prototype.sgpTopo="__SGP__",m.prototype.sgsTopo="__SGS__",m.prototype.shnTopo="__SHN__",m.prototype.slbTopo="__SLB__",m.prototype.sleTopo="__SLE__",m.prototype.slvTopo="__SLV__",m.prototype.smrTopo="__SMR__",m.prototype.solTopo="__SOL__",m.prototype.somTopo="__SOM__",m.prototype.spmTopo="__SPM__",m.prototype.srbTopo="__SRB__",m.prototype.stpTopo="__STP__",m.prototype.surTopo="__SUR__",m.prototype.svkTopo="__SVK__",m.prototype.svnTopo="__SVN__",m.prototype.sweTopo="__SWE__",m.prototype.swzTopo="__SWZ__",m.prototype.sxmTopo="__SXM__",m.prototype.sycTopo="__SYC__",m.prototype.syrTopo="__SYR__",m.prototype.tcaTopo="__TCA__",m.prototype.tcdTopo="__TCD__",m.prototype.tgoTopo="__TGO__",m.prototype.thaTopo="__THA__",m.prototype.tjkTopo="__TJK__",m.prototype.tkmTopo="__TKM__",m.prototype.tlsTopo="__TLS__",m.prototype.tonTopo="__TON__",m.prototype.ttoTopo="__TTO__",m.prototype.tunTopo="__TUN__",m.prototype.turTopo="__TUR__",m.prototype.tuvTopo="__TUV__",m.prototype.twnTopo="__TWN__",m.prototype.tzaTopo="__TZA__",m.prototype.ugaTopo="__UGA__",m.prototype.ukrTopo="__UKR__",m.prototype.umiTopo="__UMI__",m.prototype.uryTopo="__URY__",m.prototype.usaTopo="__USA__",m.prototype.usgTopo="__USG__",m.prototype.uzbTopo="__UZB__",m.prototype.vatTopo="__VAT__",m.prototype.vctTopo="__VCT__",m.prototype.venTopo="__VEN__",m.prototype.vgbTopo="__VGB__",m.prototype.virTopo="__VIR__",m.prototype.vnmTopo="__VNM__",m.prototype.vutTopo="__VUT__",m.prototype.wlfTopo="__WLF__",m.prototype.wsbTopo="__WSB__",m.prototype.wsmTopo="__WSM__",m.prototype.yemTopo="__YEM__",m.prototype.zafTopo="__ZAF__",m.prototype.zmbTopo="__ZMB__",m.prototype.zweTopo="__ZWE__",m.prototype.latLngToXY=function(a,b){return this.projection([b,a])},m.prototype.addLayer=function(a,b,c){var d;return d=c?this.svg.insert("g",":first-child"):this.svg.append("g"),d.attr("id",b||"").attr("class",a||"")},m.prototype.updateChoropleth=function(a){var b=this.svg;for(var c in a)if(a.hasOwnProperty(c)){var d,e=a[c];if(!c)continue;if(d="string"==typeof e?e:"string"==typeof e.color?e.color:this.options.fills[e.fillKey],e===Object(e)){this.options.data[c]=l(e,this.options.data[c]||{});this.svg.select("."+c).attr("data-info",JSON.stringify(this.options.data[c]))}b.selectAll("."+c).transition().style("fill",d)}},m.prototype.updatePopup=function(a,b,c){var d=this;a.on("mousemove",null),a.on("mousemove",function(){var e=n.mouse(d.options.element);n.select(d.svg[0][0].parentNode).select(".datamaps-hoverover").style("top",e[1]+30+"px").html(function(){var d=JSON.parse(a.attr("data-info"));try{return c.popupTemplate(b,d)}catch(e){return""}}).style("left",e[0]+"px")}),n.select(d.svg[0][0].parentNode).select(".datamaps-hoverover").style("display","block")},m.prototype.addPlugin=function(a,b){var c=this;"undefined"==typeof m.prototype[a]&&(m.prototype[a]=function(d,e,f,g){var h;"undefined"==typeof g&&(g=!1),"function"==typeof e&&(f=e,e=void 0),e=l(e||{},c.options[a+"Config"]),!g&&this.options[a+"Layer"]?(h=this.options[a+"Layer"],e=e||this.options[a+"Options"]):(h=this.addLayer(a),this.options[a+"Layer"]=h,this.options[a+"Options"]=e),b.apply(this,[h,d,e]),f&&f(h)})},"object"==typeof exports?(n=require("d3"),o=require("topojson"),module.exports=m):"function"==typeof define&&define.amd?define("datamaps",["require","d3","topojson"],function(a){return n=a("d3"),o=a("topojson"),m}):window.Datamap=window.Datamaps=m,window.jQuery&&(window.jQuery.fn.datamaps=function(a,b){a=a||{},a.element=this[0];var c=new m(a);return"function"==typeof b&&b(c,a),this})}();