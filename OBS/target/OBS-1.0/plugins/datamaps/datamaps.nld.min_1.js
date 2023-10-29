!function(){function a(a,b,c){"undefined"==typeof c&&(c=b,optionsValues=void 0);var d="undefined"!=typeof a?a:b;if("undefined"==typeof d)return null;if("function"==typeof d){var e=[c];return c.geography&&(e=[c.geography,c.data]),d.apply(null,e)}return d}function b(a,b,c){return this.svg=n.select(a).append("svg").attr("width",c||a.offsetWidth).attr("data-width",c||a.offsetWidth).attr("class","datamap").attr("height",b||a.offsetHeight).style("overflow","hidden"),this.options.responsive&&(n.select(this.options.element).style({position:"relative","padding-bottom":100*this.options.aspectRatio+"%"}),n.select(this.options.element).select("svg").style({position:"absolute",width:"100%",height:"100%"}),n.select(this.options.element).select("svg").select("g").selectAll("path").style("vector-effect","non-scaling-stroke")),this.svg}function c(a,b){var c,d,e=b.width||a.offsetWidth,f=b.height||a.offsetHeight,g=this.svg;return b&&"undefined"==typeof b.scope&&(b.scope="world"),"usa"===b.scope?c=n.geo.albersUsa().scale(e).translate([e/2,f/2]):"world"===b.scope&&(c=n.geo[b.projection]().scale((e+1)/2/Math.PI).translate([e/2,f/("mercator"===b.projection?1.45:1.8)])),"orthographic"===b.projection&&(g.append("defs").append("path").datum({type:"Sphere"}).attr("id","sphere").attr("d",d),g.append("use").attr("class","stroke").attr("xlink:href","#sphere"),g.append("use").attr("class","fill").attr("xlink:href","#sphere"),c.scale(250).clipAngle(90).rotate(b.projectionConfig.rotation)),d=n.geo.path().projection(c),{path:d,projection:c}}function d(){n.select(".datamaps-style-block").empty()&&n.select("head").append("style").attr("class","datamaps-style-block").html('.datamap path.datamaps-graticule { fill: none; stroke: #777; stroke-width: 0.5px; stroke-opacity: .5; pointer-events: none; } .datamap .labels {pointer-events: none;} .datamap path {stroke: #FFFFFF; stroke-width: 1px;} .datamaps-legend dt, .datamaps-legend dd { float: left; margin: 0 3px 0 0;} .datamaps-legend dd {width: 20px; margin-right: 6px; border-radius: 3px;} .datamaps-legend {padding-bottom: 20px; z-index: 1001; position: absolute; left: 4px; font-size: 12px; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;} .datamaps-hoverover {display: none; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; } .hoverinfo {padding: 4px; border-radius: 1px; background-color: #FFF; box-shadow: 1px 1px 5px #CCC; font-size: 12px; border: 1px solid #CCC; } .hoverinfo hr {border:1px dotted #CCC; }')}function e(b){var c=this.options.fills,d=this.options.data||{},e=this.options.geographyConfig,f=this.svg.select("g.datamaps-subunits");f.empty()&&(f=this.addLayer("datamaps-subunits",null,!0));var g=o.feature(b,b.objects[this.options.scope]).features;e.hideAntarctica&&(g=g.filter(function(a){return"ATA"!==a.id})),e.hideHawaiiAndAlaska&&(g=g.filter(function(a){return"HI"!==a.id&&"AK"!==a.id}));var h=f.selectAll("path.datamaps-subunit").data(g);h.enter().append("path").attr("d",this.path).attr("class",function(a){return"datamaps-subunit "+a.id}).attr("data-info",function(a){return JSON.stringify(d[a.id])}).style("fill",function(b){var e,f=d[b.id];return f&&f.fillKey&&(e=c[a(f.fillKey,{data:d[b.id],geography:b})]),"undefined"==typeof e&&(e=a(f&&f.fillColor,c.defaultFill,{data:d[b.id],geography:b})),e}).style("stroke-width",e.borderWidth).style("stroke",e.borderColor)}function f(){function b(){this.parentNode.appendChild(this)}var c=this.svg,d=this,e=this.options.geographyConfig;(e.highlightOnHover||e.popupOnHover)&&c.selectAll(".datamaps-subunit").on("mouseover",function(f){var g=n.select(this),h=d.options.data[f.id]||{};if(e.highlightOnHover){var i={fill:g.style("fill"),stroke:g.style("stroke"),"stroke-width":g.style("stroke-width"),"fill-opacity":g.style("fill-opacity")};g.style("fill",a(h.highlightFillColor,e.highlightFillColor,h)).style("stroke",a(h.highlightBorderColor,e.highlightBorderColor,h)).style("stroke-width",a(h.highlightBorderWidth,e.highlightBorderWidth,h)).style("fill-opacity",a(h.highlightFillOpacity,e.highlightFillOpacity,h)).attr("data-previousAttributes",JSON.stringify(i)),/((MSIE)|(Trident))/.test(navigator.userAgent)||b.call(this)}e.popupOnHover&&d.updatePopup(g,f,e,c)}).on("mouseout",function(){var a=n.select(this);if(e.highlightOnHover){var b=JSON.parse(a.attr("data-previousAttributes"));for(var c in b)a.style(c,b[c])}a.on("mousemove",null),n.selectAll(".datamaps-hoverover").style("display","none")})}function g(a,b,c){if(b=b||{},this.options.fills){var d="<dl>",e="";b.legendTitle&&(d="<h2>"+b.legendTitle+"</h2>"+d);for(var f in this.options.fills){if("defaultFill"===f){if(!b.defaultFillName)continue;e=b.defaultFillName}else e=b.labels&&b.labels[f]?b.labels[f]:f+": ";d+="<dt>"+e+"</dt>",d+='<dd style="background-color:'+this.options.fills[f]+'">&nbsp;</dd>'}d+="</dl>";n.select(this.options.element).append("div").attr("class","datamaps-legend").html(d)}}function h(a,b){var c=n.geo.graticule();this.svg.insert("path",".datamaps-subunits").datum(c).attr("class","datamaps-graticule").attr("d",this.path)}function i(b,c,d){var e=this;this.svg;if(!c||c&&!c.slice)throw"Datamaps Error - arcs must be an array";for(var f=0;f<c.length;f++)c[f]=l(c[f],c[f].options),delete c[f].options;"undefined"==typeof d&&(d=p.arcConfig);var g=b.selectAll("path.datamaps-arc").data(c,JSON.stringify),h=n.geo.path().projection(e.projection);g.enter().append("svg:path").attr("class","datamaps-arc").style("stroke-linecap","round").style("stroke",function(b){return a(b.strokeColor,d.strokeColor,b)}).style("fill","none").style("stroke-width",function(b){return a(b.strokeWidth,d.strokeWidth,b)}).attr("d",function(b){var c=e.latLngToXY(a(b.origin.latitude,b),a(b.origin.longitude,b)),f=e.latLngToXY(a(b.destination.latitude,b),a(b.destination.longitude,b)),g=[(c[0]+f[0])/2,(c[1]+f[1])/2];if(d.greatArc){var i=n.geo.greatArc().source(function(b){return[a(b.origin.longitude,b),a(b.origin.latitude,b)]}).target(function(b){return[a(b.destination.longitude,b),a(b.destination.latitude,b)]});return h(i(b))}var j=a(b.arcSharpness,d.arcSharpness,b);return"M"+c[0]+","+c[1]+"S"+(g[0]+50*j)+","+(g[1]-75*j)+","+f[0]+","+f[1]}).transition().delay(100).style("fill",function(b){var c=this.getTotalLength();return this.style.transition=this.style.WebkitTransition="none",this.style.strokeDasharray=c+" "+c,this.style.strokeDashoffset=c,this.getBoundingClientRect(),this.style.transition=this.style.WebkitTransition="stroke-dashoffset "+a(b.animationSpeed,d.animationSpeed,b)+"ms ease-out",this.style.strokeDashoffset="0","none"}),g.exit().transition().style("opacity",0).remove()}function j(a,b){var c=this;b=b||{};var d=this.projection([-67.707617,42.722131]);this.svg.selectAll(".datamaps-subunit").attr("data-foo",function(e){var f=c.path.centroid(e),g=7.5,h=5;["FL","KY","MI"].indexOf(e.id)>-1&&(g=-2.5),"NY"===e.id&&(g=-1),"MI"===e.id&&(h=18),"LA"===e.id&&(g=13);var i,j;i=f[0]-g,j=f[1]+h;var k=["VT","NH","MA","RI","CT","NJ","DE","MD","DC"].indexOf(e.id);if(k>-1){var l=d[1];i=d[0],j=l+k*(2+(b.fontSize||12)),a.append("line").attr("x1",i-3).attr("y1",j-5).attr("x2",f[0]).attr("y2",f[1]).style("stroke",b.labelColor||"#000").style("stroke-width",b.lineWidth||1)}return a.append("text").attr("x",i).attr("y",j).style("font-size",(b.fontSize||10)+"px").style("font-family",b.fontFamily||"Verdana").style("fill",b.labelColor||"#000").text(e.id),"bar"})}function k(b,c,d){function e(a){return"undefined"!=typeof a&&"undefined"!=typeof a.latitude&&"undefined"!=typeof a.longitude}var f=this,g=this.options.fills,h=this.options.filters,i=this.svg;if(!c||c&&!c.slice)throw"Datamaps Error - bubbles must be an array";var j=b.selectAll("circle.datamaps-bubble").data(c,d.key);j.enter().append("svg:circle").attr("class","datamaps-bubble").attr("cx",function(a){var b;return e(a)?b=f.latLngToXY(a.latitude,a.longitude):a.centered&&(b=f.path.centroid(i.select("path."+a.centered).data()[0])),b?b[0]:void 0}).attr("cy",function(a){var b;return e(a)?b=f.latLngToXY(a.latitude,a.longitude):a.centered&&(b=f.path.centroid(i.select("path."+a.centered).data()[0])),b?b[1]:void 0}).attr("r",function(b){return d.animate?0:a(b.radius,d.radius,b)}).attr("data-info",function(a){return JSON.stringify(a)}).attr("filter",function(b){var c=h[a(b.filterKey,d.filterKey,b)];return c?c:void 0}).style("stroke",function(b){return a(b.borderColor,d.borderColor,b)}).style("stroke-width",function(b){return a(b.borderWidth,d.borderWidth,b)}).style("fill-opacity",function(b){return a(b.fillOpacity,d.fillOpacity,b)}).style("fill",function(b){var c=g[a(b.fillKey,d.fillKey,b)];return c||g.defaultFill}).on("mouseover",function(b){var c=n.select(this);if(d.highlightOnHover){var e={fill:c.style("fill"),stroke:c.style("stroke"),"stroke-width":c.style("stroke-width"),"fill-opacity":c.style("fill-opacity")};c.style("fill",a(b.highlightFillColor,d.highlightFillColor,b)).style("stroke",a(b.highlightBorderColor,d.highlightBorderColor,b)).style("stroke-width",a(b.highlightBorderWidth,d.highlightBorderWidth,b)).style("fill-opacity",a(b.highlightFillOpacity,d.highlightFillOpacity,b)).attr("data-previousAttributes",JSON.stringify(e))}d.popupOnHover&&f.updatePopup(c,b,d,i)}).on("mouseout",function(a){var b=n.select(this);if(d.highlightOnHover){var c=JSON.parse(b.attr("data-previousAttributes"));for(var e in c)b.style(e,c[e])}n.selectAll(".datamaps-hoverover").style("display","none")}),j.transition().duration(400).attr("r",function(b){return a(b.radius,d.radius,b)}),j.exit().transition().delay(d.exitDelay).attr("r",0).remove()}function l(a){return Array.prototype.slice.call(arguments,1).forEach(function(b){if(b)for(var c in b)null==a[c]&&(a[c]=b[c])}),a}function m(a){if("undefined"==typeof n||"undefined"==typeof o)throw new Error("Include d3.js (v3.0.3 or greater) and topojson on this page before creating a new map");return this.options=l(a,p),this.options.geographyConfig=l(a.geographyConfig,p.geographyConfig),this.options.projectionConfig=l(a.projectionConfig,p.projectionConfig),this.options.bubblesConfig=l(a.bubblesConfig,p.bubblesConfig),this.options.arcConfig=l(a.arcConfig,p.arcConfig),n.select(this.options.element).select("svg").length>0&&b.call(this,this.options.element,this.options.height,this.options.width),this.addPlugin("bubbles",k),this.addPlugin("legend",g),this.addPlugin("arc",i),this.addPlugin("labels",j),this.addPlugin("graticule",h),this.options.disableDefaultStyles||d(),this.draw()}var n=window.d3,o=window.topojson,p={scope:"world",responsive:!1,aspectRatio:.5625,setProjection:c,projection:"equirectangular",dataType:"json",data:{},done:function(){},fills:{defaultFill:"#ABDDA4"},filters:{},geographyConfig:{dataUrl:null,hideAntarctica:!0,hideHawaiiAndAlaska:!1,borderWidth:1,borderColor:"#FDFDFD",popupTemplate:function(a,b){return'<div class="hoverinfo"><strong>'+a.properties.name+"</strong></div>"},popupOnHover:!0,highlightOnHover:!0,highlightFillColor:"#FC8D59",highlightBorderColor:"rgba(250, 15, 160, 0.2)",highlightBorderWidth:2},projectionConfig:{rotation:[97,0]},bubblesConfig:{borderWidth:2,borderColor:"#FFFFFF",popupOnHover:!0,radius:null,popupTemplate:function(a,b){return'<div class="hoverinfo"><strong>'+b.name+"</strong></div>"},fillOpacity:.75,animate:!0,highlightOnHover:!0,highlightFillColor:"#FC8D59",highlightBorderColor:"rgba(250, 15, 160, 0.2)",highlightBorderWidth:2,highlightFillOpacity:.85,exitDelay:100,key:JSON.stringify},arcConfig:{strokeColor:"#DD1C77",strokeWidth:1,arcSharpness:1,animationSpeed:600}};m.prototype.resize=function(){var a=this,b=a.options;if(b.responsive){var c=b.element.clientWidth,d=n.select(b.element).select("svg").attr("data-width");n.select(b.element).select("svg").selectAll("g").attr("transform","scale("+c/d+")")}},m.prototype.draw=function(){function a(a){b.options.dataUrl&&n[b.options.dataType](b.options.dataUrl,function(a){if("csv"===b.options.dataType&&a&&a.slice){for(var c={},d=0;d<a.length;d++)c[a[d].id]=a[d];a=c}Datamaps.prototype.updateChoropleth.call(b,a)}),e.call(b,a),f.call(b),(b.options.geographyConfig.popupOnHover||b.options.bubblesConfig.popupOnHover)&&(hoverover=n.select(b.options.element).append("div").attr("class","datamaps-hoverover").style("z-index",10001).style("position","absolute")),b.options.done(b)}var b=this,c=b.options,d=c.setProjection.apply(b,[c.element,c]);return this.path=d.path,this.projection=d.projection,c.geographyConfig.dataUrl?n.json(c.geographyConfig.dataUrl,function(c,d){if(c)throw new Error(c);b.customTopo=d,a(d)}):a(this[c.scope+"Topo"]||c.geographyConfig.dataJson),this},m.prototype.worldTopo="__WORLD__",m.prototype.abwTopo="__ABW__",m.prototype.afgTopo="__AFG__",m.prototype.agoTopo="__AGO__",m.prototype.aiaTopo="__AIA__",m.prototype.albTopo="__ALB__",m.prototype.aldTopo="__ALD__",m.prototype.andTopo="__AND__",m.prototype.areTopo="__ARE__",m.prototype.argTopo="__ARG__",m.prototype.armTopo="__ARM__",m.prototype.asmTopo="__ASM__",m.prototype.ataTopo="__ATA__",m.prototype.atcTopo="__ATC__",m.prototype.atfTopo="__ATF__",m.prototype.atgTopo="__ATG__",m.prototype.ausTopo="__AUS__",m.prototype.autTopo="__AUT__",m.prototype.azeTopo="__AZE__",m.prototype.bdiTopo="__BDI__",m.prototype.belTopo="__BEL__",m.prototype.benTopo="__BEN__",m.prototype.bfaTopo="__BFA__",m.prototype.bgdTopo="__BGD__",m.prototype.bgrTopo="__BGR__",m.prototype.bhrTopo="__BHR__",m.prototype.bhsTopo="__BHS__",m.prototype.bihTopo="__BIH__",m.prototype.bjnTopo="__BJN__",m.prototype.blmTopo="__BLM__",m.prototype.blrTopo="__BLR__",m.prototype.blzTopo="__BLZ__",m.prototype.bmuTopo="__BMU__",m.prototype.bolTopo="__BOL__",m.prototype.braTopo="__BRA__",m.prototype.brbTopo="__BRB__",m.prototype.brnTopo="__BRN__",m.prototype.btnTopo="__BTN__",m.prototype.norTopo="__NOR__",m.prototype.bwaTopo="__BWA__",m.prototype.cafTopo="__CAF__",m.prototype.canTopo="__CAN__",m.prototype.cheTopo="__CHE__",m.prototype.chlTopo="__CHL__",m.prototype.chnTopo="__CHN__",m.prototype.civTopo="__CIV__",m.prototype.clpTopo="__CLP__",m.prototype.cmrTopo="__CMR__",m.prototype.codTopo="__COD__",m.prototype.cogTopo="__COG__",m.prototype.cokTopo="__COK__",m.prototype.colTopo="__COL__",m.prototype.comTopo="__COM__",m.prototype.cpvTopo="__CPV__",m.prototype.criTopo="__CRI__",m.prototype.csiTopo="__CSI__",m.prototype.cubTopo="__CUB__",m.prototype.cuwTopo="__CUW__",m.prototype.cymTopo="__CYM__",m.prototype.cynTopo="__CYN__",m.prototype.cypTopo="__CYP__",m.prototype.czeTopo="__CZE__",m.prototype.deuTopo="__DEU__",m.prototype.djiTopo="__DJI__",m.prototype.dmaTopo="__DMA__",m.prototype.dnkTopo="__DNK__",m.prototype.domTopo="__DOM__",m.prototype.dzaTopo="__DZA__",m.prototype.ecuTopo="__ECU__",m.prototype.egyTopo="__EGY__",m.prototype.eriTopo="__ERI__",m.prototype.esbTopo="__ESB__",m.prototype.espTopo="__ESP__",m.prototype.estTopo="__EST__",m.prototype.ethTopo="__ETH__",m.prototype.finTopo="__FIN__",m.prototype.fjiTopo="__FJI__",m.prototype.flkTopo="__FLK__",m.prototype.fraTopo="__FRA__",m.prototype.froTopo="__FRO__",m.prototype.fsmTopo="__FSM__",m.prototype.gabTopo="__GAB__",m.prototype.psxTopo="__PSX__",m.prototype.gbrTopo="__GBR__",m.prototype.geoTopo="__GEO__",m.prototype.ggyTopo="__GGY__",m.prototype.ghaTopo="__GHA__",m.prototype.gibTopo="__GIB__",m.prototype.ginTopo="__GIN__",m.prototype.gmbTopo="__GMB__",m.prototype.gnbTopo="__GNB__",m.prototype.gnqTopo="__GNQ__",m.prototype.grcTopo="__GRC__",m.prototype.grdTopo="__GRD__",m.prototype.grlTopo="__GRL__",m.prototype.gtmTopo="__GTM__",m.prototype.gumTopo="__GUM__",m.prototype.guyTopo="__GUY__",m.prototype.hkgTopo="__HKG__",m.prototype.hmdTopo="__HMD__",m.prototype.hndTopo="__HND__",m.prototype.hrvTopo="__HRV__",m.prototype.htiTopo="__HTI__",m.prototype.hunTopo="__HUN__",m.prototype.idnTopo="__IDN__",m.prototype.imnTopo="__IMN__",m.prototype.indTopo="__IND__",m.prototype.ioaTopo="__IOA__",m.prototype.iotTopo="__IOT__",m.prototype.irlTopo="__IRL__",m.prototype.irnTopo="__IRN__",m.prototype.irqTopo="__IRQ__",m.prototype.islTopo="__ISL__",m.prototype.isrTopo="__ISR__",m.prototype.itaTopo="__ITA__",m.prototype.jamTopo="__JAM__",m.prototype.jeyTopo="__JEY__",m.prototype.jorTopo="__JOR__",m.prototype.jpnTopo="__JPN__",m.prototype.kabTopo="__KAB__",m.prototype.kasTopo="__KAS__",m.prototype.kazTopo="__KAZ__",m.prototype.kenTopo="__KEN__",m.prototype.kgzTopo="__KGZ__",m.prototype.khmTopo="__KHM__",m.prototype.kirTopo="__KIR__",m.prototype.knaTopo="__KNA__",m.prototype.korTopo="__KOR__",m.prototype.kosTopo="__KOS__",m.prototype.kwtTopo="__KWT__",m.prototype.laoTopo="__LAO__",m.prototype.lbnTopo="__LBN__",m.prototype.lbrTopo="__LBR__",m.prototype.lbyTopo="__LBY__",m.prototype.lcaTopo="__LCA__",m.prototype.lieTopo="__LIE__",m.prototype.lkaTopo="__LKA__",m.prototype.lsoTopo="__LSO__",m.prototype.ltuTopo="__LTU__",m.prototype.luxTopo="__LUX__",m.prototype.lvaTopo="__LVA__",m.prototype.macTopo="__MAC__",m.prototype.mafTopo="__MAF__",m.prototype.marTopo="__MAR__",m.prototype.mcoTopo="__MCO__",m.prototype.mdaTopo="__MDA__",m.prototype.mdgTopo="__MDG__",m.prototype.mdvTopo="__MDV__",m.prototype.mexTopo="__MEX__",m.prototype.mhlTopo="__MHL__",m.prototype.mkdTopo="__MKD__",m.prototype.mliTopo="__MLI__",m.prototype.mltTopo="__MLT__",m.prototype.mmrTopo="__MMR__",m.prototype.mneTopo="__MNE__",m.prototype.mngTopo="__MNG__",m.prototype.mnpTopo="__MNP__",m.prototype.mozTopo="__MOZ__",m.prototype.mrtTopo="__MRT__",m.prototype.msrTopo="__MSR__",m.prototype.musTopo="__MUS__",m.prototype.mwiTopo="__MWI__",m.prototype.mysTopo="__MYS__",m.prototype.namTopo="__NAM__",m.prototype.nclTopo="__NCL__",m.prototype.nerTopo="__NER__",m.prototype.nfkTopo="__NFK__",m.prototype.ngaTopo="__NGA__",m.prototype.nicTopo="__NIC__",m.prototype.niuTopo="__NIU__",m.prototype.nldTopo={type:"Topology",objects:{nld:{type:"GeometryCollection",geometries:[{type:"Polygon",properties:{name:null},id:"-99",arcs:[[0]]},{type:"Polygon",properties:{name:"Noord-Brabant"},id:"NL.NB",arcs:[[1,2,3,4,5,6,7,8,9]]},{type:"Polygon",properties:{name:"Utrecht"},id:"NL.UT",arcs:[[10,11,12,13]]},{type:"Polygon",properties:{name:"Zuid-Holland"},id:"NL.ZH",arcs:[[-13,14,-9,15,16,17]]},{type:"MultiPolygon",properties:{name:"Noord-Holland"},id:"NL.NH",arcs:[[[18,-14,-18,19,20]],[[21]]]},{type:"Polygon",properties:{name:"Saba"},id:"NL.",arcs:[[22]]},{type:"Polygon",properties:{name:"St. Eustatius"},id:"NL.",arcs:[[23]]},{type:"Polygon",properties:{name:"Bonaire"},id:"NL.",arcs:[[24]]},{type:"Polygon",properties:{name:"Drenthe"},id:"NL.DR",arcs:[[25,26,27,28]]},{type:"MultiPolygon",properties:{name:"Friesland"},id:"NL.FR",arcs:[[[29]],[[-28,30,31,-21,32,33]],[[34]],[[35]],[[36]]]},{type:"Polygon",properties:{name:"Gelderland"},id:"NL.GE",arcs:[[37,38,-10,-15,-12,39,40]]},{type:"MultiPolygon",properties:{name:"Groningen"},id:"NL.GR",arcs:[[[-29,-34,41]],[[42]]]},{type:"Polygon",properties:{name:"Limburg"},id:"NL.LI",arcs:[[43,-2,-39]]},{type:"Polygon",properties:{name:"Overijssel"},id:"NL.OV",arcs:[[44,-41,45,-31,-27]]},{type:"Polygon",properties:{name:"Flevoland"},id:"NL.FL",arcs:[[-46,-40,-11,-19,-32]]},{type:"MultiPolygon",properties:{name:"Zeeland"},id:"NL.ZE",arcs:[[[46]],[[47,-6]],[[-4,48]],[[-8,49,-16]],[[50]]]}]}},arcs:[[[9918,9997],[3,0],[-1,-1],[-1,-1],[0,-1],[-1,-1],[-2,1],[0,1],[2,2]],[[9822,9566],[3,-1],[0,-3],[1,-3],[2,-2],[5,0],[2,-2],[2,-9],[2,-3],[-1,-2],[1,-1],[1,-1],[1,-1],[3,-5],[0,-1],[1,-1],[1,-7],[1,-2],[0,-2],[-2,-3],[-3,3],[-2,0],[-6,-2],[-4,-1],[-1,0],[-5,2],[-5,1],[2,-15],[3,-14],[5,-7],[3,-8],[-5,-5],[-3,-3],[-4,-1],[-9,-3],[-13,-5],[-3,-4],[-1,-1],[-2,-5],[-2,-8],[0,-2],[-1,-1],[-1,-1],[-1,0],[-4,-1],[-2,-1]],[[9781,9435],[-1,1],[0,6],[-1,4],[-2,4],[-3,2],[-3,1],[-3,-2],[-6,-4],[-2,-2],[-16,1],[-4,-1],[-1,0],[-2,0],[0,9],[-3,3],[-2,1],[-5,-1],[-2,2],[-1,1],[-1,6],[-1,2],[-5,5],[-1,3],[1,5],[1,4],[1,4],[-3,5],[-4,3],[0,1],[-2,-1],[-1,-1],[0,-2],[-1,-3],[-2,-4],[-3,-5],[-4,-4],[-3,0],[-5,2],[-2,1],[-9,0],[-3,2],[1,3],[1,0],[6,-3],[-1,4],[0,4],[1,3],[0,4],[-1,2],[-3,1],[-2,1],[-2,1],[-4,-3],[-10,-14],[-2,-1],[-2,-1],[-2,0],[-4,1],[-4,-1],[-1,0],[-3,2],[0,3],[1,3],[1,4],[-1,2],[-2,0],[-4,-1],[-7,-3],[-7,-4],[2,-2],[-1,-2],[-1,-2],[0,-2],[1,-2],[3,-4],[1,-3],[-1,-4],[-2,-1],[-6,0],[-3,1],[-5,3],[-1,0]],[[9613,9472],[0,2],[0,1],[-2,2],[0,4],[0,3],[0,1],[0,1],[1,1],[-1,3]],[[9611,9490],[3,1],[1,5],[-1,6],[-3,4],[-3,2],[-1,0]],[[9607,9508],[1,5],[0,1],[0,3],[-1,3],[0,1],[-4,4]],[[9603,9525],[0,5],[-2,2]],[[9601,9532],[1,5]],[[9602,9537],[6,2],[5,0],[7,2],[5,4],[4,9],[14,-3],[5,0],[5,1],[5,3],[3,1],[4,0],[7,9],[2,5],[3,3],[4,3],[7,1],[3,1],[5,5],[4,0],[6,-1],[4,0]],[[9710,9582],[0,-2],[0,-1],[2,-3],[5,-4],[3,0],[2,0],[4,-4],[0,-4],[-1,-3],[1,-1],[24,3],[3,2],[2,2],[2,3],[1,4],[1,5],[2,1],[6,0],[2,1],[3,2],[3,1],[2,-2],[2,0],[8,1],[6,-1],[1,-2],[2,-4],[1,-1],[3,-1],[9,-7],[13,-1]],[[9757,9692],[5,-4]],[[9762,9688],[0,-4],[-1,-5],[0,-2],[1,-2],[4,-4],[0,-2],[0,-1],[-1,-1],[-1,0],[0,-1],[1,-1],[3,-2],[3,0],[1,-1],[1,-2],[1,-1],[1,0],[1,-2],[0,-1],[-1,-2],[0,-1],[1,-1],[0,-1],[-2,0],[-1,-2],[-1,-3],[-1,-1],[-1,-1],[0,-1],[1,0],[3,-2],[2,0],[1,1],[0,1],[1,0],[1,0],[0,1],[1,1],[0,1],[0,1],[-1,2],[2,0],[2,-5],[0,-1],[0,-1],[0,-6],[1,-7],[2,-4],[2,-3],[1,-2],[1,-1],[0,-1],[0,-2],[0,-3],[0,-2],[-5,2],[-10,7],[-6,1],[-1,-1],[-3,-2],[-1,0],[-2,0],[-3,1],[-3,-1],[-4,-3],[-3,-1],[-7,5],[-2,-1],[-2,-2],[-4,0],[-2,0]],[[9732,9616],[-1,0],[-2,2],[-2,1],[-1,4],[-2,1],[-2,1],[-1,-1],[-1,-1],[-3,-1],[-1,-1],[-2,-3],[-2,0],[-5,1],[-5,-3],[-3,-4],[-2,-1],[-3,0],[-1,-1],[-3,5],[-4,6],[-1,2],[0,1],[1,0],[1,1],[2,1],[-1,3],[-6,-1],[0,1],[4,8],[5,2],[1,2],[-6,0],[-2,9],[-2,1],[-1,2],[0,1],[4,4],[1,0],[1,-1],[3,-1],[0,1],[1,0],[-1,1],[-1,3],[0,2],[1,1],[-6,7],[-3,1],[-1,1],[-1,1],[-1,3]],[[9678,9677],[6,2],[2,2],[2,2],[3,2],[6,0],[1,4],[1,1],[2,0],[2,1],[3,2],[1,0],[1,-1],[1,0],[0,-1],[3,1],[5,-1],[-4,-2],[-1,-1],[1,-1],[0,-1],[0,-1],[1,0],[0,-1],[1,0],[0,-1],[1,-2],[-2,-3],[-1,-5],[1,-4],[0,-5],[4,1],[2,1],[5,1],[7,0],[3,2],[1,2],[1,3],[1,2],[0,2],[3,8],[2,4],[1,1],[1,0],[7,0],[5,1]],[[9732,9616],[-3,-8],[0,-1],[-5,-9],[0,-2],[0,-1],[0,-1],[-1,-1],[-10,-5],[-4,0],[1,-1],[0,-1],[-1,-2],[1,-2]],[[9602,9537],[-3,1],[-3,2],[-3,2],[-2,-2],[0,-1]],[[9591,9539],[0,1],[0,3],[0,2],[2,2],[2,1],[4,0],[-1,2],[-3,3],[-9,3],[-2,3],[-1,8],[-2,5],[-4,3],[-3,3],[-3,-2],[-3,-1],[-4,0],[-2,-1],[-1,-1],[-1,0],[-1,0],[-1,7],[4,3],[8,2],[1,2],[3,0],[4,-1],[4,-2],[1,0],[2,1],[1,1],[-1,2],[-3,6],[-1,1],[-1,1],[0,1],[0,2],[1,1],[1,1],[0,1],[-1,4],[-2,9],[-2,4],[1,2],[1,2],[6,-2],[5,1],[5,3],[19,26],[16,27],[12,24]],[[9642,9702],[6,-3],[1,0],[2,0],[3,1],[3,-1],[-6,-10],[0,-1],[0,-1],[0,-2],[-1,-3],[-2,-3],[1,-2],[1,0],[1,-1],[1,-1],[1,0],[3,0],[6,2],[3,1],[5,2],[1,0],[1,-4],[0,-1],[1,-1],[5,3]],[[9757,9814],[-1,-24],[-7,2],[-4,-3],[-2,-9],[-22,-16],[3,-16],[6,-10],[4,-11],[-5,0],[-7,-8],[0,-7],[7,-9],[4,-1],[5,0],[3,0],[5,-1],[11,-9]],[[9642,9702],[1,3],[8,26],[1,7],[0,2],[3,6],[6,47],[2,12],[0,3],[2,8],[5,16],[1,8],[1,4],[0,6],[1,5],[2,2],[8,-2],[1,2],[1,-2],[-2,-7],[3,-5],[6,-1],[5,0],[3,2],[5,5],[3,1],[5,1],[6,3],[13,13]],[[9732,9867],[0,-1],[1,-3],[10,-31],[14,-18]],[[9694,9891],[0,-1],[3,0],[-1,-3],[-2,-4],[-4,-6],[-6,-6],[-3,-6],[-4,-2],[-5,2],[-2,7],[0,6],[3,7],[3,6],[7,6],[3,7],[3,6],[4,0],[1,-2],[0,-1],[0,-1],[-1,-1],[2,-4],[1,-4],[0,-4],[-2,-2]],[[685,1354],[1,-1],[1,-3],[-1,-3],[-1,-1],[-2,3],[0,4],[2,1]],[[717,1325],[2,-2],[0,-3],[2,-2],[3,-3],[-1,-3],[-1,-2],[-3,1],[-2,6],[0,8]],[[27,50],[1,-2],[2,-2],[0,-2],[-1,-1],[-2,-3],[1,-12],[0,-5],[-1,-1],[-3,-1],[0,-1],[0,-2],[1,-6],[0,-3],[0,-2],[0,-3],[-1,-3],[-1,-1],[-1,0],[-1,1],[-3,11],[-1,4],[0,5],[1,7],[0,5],[-1,5],[-2,6],[-2,2],[-7,2],[-3,2],[-2,3],[-1,4],[2,4],[-1,2],[0,3],[1,2],[2,1],[1,0],[2,-2],[3,-6],[1,-2],[3,-1],[8,-7],[4,-1],[1,0]],[[9982,9826],[-1,-4],[-1,-8],[-1,-26],[-1,-8],[-3,-5],[-5,1],[-2,1],[-6,-1],[-7,2],[-13,0],[-4,-1],[-2,-2]],[[9936,9775],[-2,1],[0,2],[0,2],[-1,0],[0,1],[-10,5],[-2,0],[-4,-1],[-6,-4],[-2,-2],[0,-1],[0,-7],[-5,3],[-1,0],[-1,0],[-1,-1],[-1,0],[-1,0],[0,1],[-1,1],[-1,0],[0,-1],[-1,0],[-3,-1],[-1,0],[-1,0],[-1,4],[-1,1],[-2,3],[-2,2],[-1,2],[-1,0],[-6,0],[-1,0],[-5,3],[-2,1],[-1,0],[0,-1],[-1,-1],[-1,0],[-1,1],[-1,0],[0,1],[-1,1],[-1,1],[-4,13],[1,3],[4,1],[4,6],[1,2],[-1,2],[-2,2],[-1,1],[-6,8]],[[9858,9829],[11,10],[4,5],[1,2],[2,1],[3,0],[3,-1],[5,-3],[6,4],[1,1],[3,7],[1,1],[0,1],[-2,4],[-7,11],[0,2],[-1,3],[0,1],[0,1],[-1,1],[-3,2],[-2,1],[-1,1],[0,3]],[[9881,9887],[3,-1],[1,1],[2,4],[1,2],[0,2],[2,4],[0,1],[1,0],[0,3],[2,3],[2,1],[3,2],[4,5],[5,-2],[2,-2],[2,1],[2,-4],[2,-4],[1,0],[0,-1],[2,-1],[4,-6],[2,-4],[0,-1],[1,0],[8,3],[3,0],[2,-1],[5,-6],[6,-7],[3,-3],[3,-3],[4,-5],[5,-6],[6,-9],[7,-9],[1,0],[0,-2],[-3,-9],[3,-1],[1,-1],[3,-3],[0,-1],[0,-1]],[[9700,9919],[-4,-3],[-4,2],[6,8],[9,8],[8,6],[7,-1],[0,-1],[-3,0],[-2,-1],[-4,-2],[-10,-11],[-3,-5]],[[9858,9829],[-6,-2],[-2,0],[-3,-1],[0,-1],[0,-1],[-2,-2],[-5,0],[-1,0],[-1,2],[-2,2],[-1,0],[0,1],[0,-1],[-1,0],[-2,-1],[-1,0],[0,-1],[-1,-1],[0,-1],[-1,-1],[-1,0],[-3,-3],[-1,0],[-1,0],[-4,0],[0,1],[-2,1],[-5,-3]],[[9812,9817],[-1,4],[-4,4],[-1,1],[-3,-1],[-2,1],[-3,0],[-3,-1],[-3,-2],[-4,-4],[-6,-4],[-25,-1]],[[9732,9867],[13,13],[2,2],[3,3],[6,1],[2,2],[3,6],[4,16],[2,8],[5,6],[3,3],[5,2],[2,3],[2,3],[3,3],[2,1],[7,1],[4,4],[21,9],[5,4],[3,0],[9,5],[13,1],[14,1]],[[9865,9964],[-1,-4],[-1,-2],[1,-6],[2,-1],[3,0],[0,-1],[1,0],[0,-1],[1,-1],[1,0],[1,0],[1,0],[0,1],[3,-1],[0,-1],[0,-1],[0,-4],[0,-2],[1,0],[0,-1],[-2,-3],[-2,-2],[0,-1],[-1,-3],[-2,-4],[-2,-3],[1,-2],[0,-1],[0,-1],[0,-1],[0,-1],[-5,-7],[-1,-3],[-1,-6],[0,-5],[2,-1],[1,-2],[2,-1],[5,0],[3,-1],[4,-3],[1,-1]],[[9765,9962],[-6,-2],[-5,-2],[-18,-8],[-4,0],[-2,3],[2,4],[7,3],[2,2],[3,0],[18,4],[2,2],[2,2],[20,4],[-3,-5],[-4,-1],[-8,-1],[1,-2],[0,-1],[-2,-1],[-5,-1]],[[9829,9979],[6,-3],[-14,-4],[-13,0],[-4,-1],[-6,-3],[-3,1],[-3,4],[1,3],[2,2],[2,-1],[32,2]],[[9861,9978],[-3,-4],[-1,1],[0,1],[1,1],[-1,4],[3,3],[5,2],[4,1],[13,1],[3,-1],[0,-1],[-1,0],[-23,-8]],[[9943,9650],[-1,0],[-2,-1],[-3,-3],[0,-1],[-1,-3],[-1,-2],[-2,-1],[-1,0],[-2,-1],[0,-2],[0,-4],[2,-1],[3,-1],[8,-6],[4,-4],[1,-1],[0,-2],[0,-3],[-1,0],[-1,0],[-1,-2],[-3,-6],[-3,-4],[-4,-2],[-11,-1],[-14,-5],[-6,-5],[-2,-2],[-3,0],[-8,3],[1,-5],[-1,-3],[-5,-1],[0,4],[-2,1],[-5,1],[-1,1],[-2,3],[0,1],[-2,0],[-4,-1],[-4,2],[-4,4],[-5,2],[-4,-3],[1,-1],[5,-6],[2,-3],[-2,0],[-3,1],[-4,2],[-6,-2],[-2,-1],[-2,-2],[-3,-2],[-5,-1],[-3,-1],[0,-3],[3,-2],[2,-5],[0,-5],[-3,-2]],[[9833,9563],[-4,2],[0,1],[-2,3],[-1,1],[-1,0],[-1,0],[-2,-1],[0,-3]],[[9762,9688],[3,-1],[9,2],[5,2],[2,5],[2,5],[2,6],[3,3],[3,3],[4,3],[4,2],[6,3],[5,3],[4,3],[2,3],[3,5],[2,5],[2,6],[0,3],[0,1]],[[9823,9750],[2,-1],[1,0],[2,-3],[3,-6],[2,-1],[4,2],[4,4],[4,2],[1,-1],[1,0],[1,-2],[1,-2],[2,-3],[1,-1],[1,-1],[1,-4],[1,-3],[3,-5],[1,-1],[-1,-3],[-2,-6],[-4,-1],[0,-1],[-1,0],[1,-2],[0,-1],[-1,-2],[-1,-5],[0,-2],[1,-3],[1,-1],[3,-1],[2,-7],[0,-2],[0,-1],[0,-1],[2,-1],[1,0],[0,-1],[-1,-2],[0,-1],[1,-1],[1,-1],[1,0],[1,2],[1,1],[2,0],[9,-2],[8,0],[1,1],[2,1],[5,2],[4,0],[1,-2],[6,-10],[4,-4],[3,0],[5,-1],[4,1],[1,0],[1,0],[0,-1],[0,-1],[0,-1],[1,0],[5,1],[1,-1],[1,0],[1,0],[0,-1],[0,-1],[0,-3],[0,-1],[-1,-3],[13,-4],[1,-1],[1,0]],[[9865,9964],[12,0],[1,-1],[2,-2],[2,0],[1,0],[3,3],[20,6],[31,6],[13,-3],[3,-1],[2,-3],[5,-20],[4,-2],[0,-1],[0,-1],[1,-1],[1,-1],[4,-1],[5,-4],[3,1],[1,-1],[1,-1],[2,1],[1,1],[1,0],[0,-1],[-1,-1],[-1,-1],[1,-1],[0,-2],[0,-4],[4,-3],[10,-2],[1,0],[1,-7],[0,-4],[0,-4],[-1,-4],[-2,-5],[-1,-2],[1,-3],[0,-2],[1,-1],[0,-2],[1,-17],[0,-9],[-1,-8],[-3,-8],[-11,-18],[-1,-4]],[[9901,9999],[7,-3],[-1,0],[0,-1],[-1,0],[0,-1],[-5,1],[-2,2],[0,2],[2,0]],[[9833,9563],[0,-1],[-1,-3],[2,0],[4,0],[1,-1],[3,-2],[1,-2],[-1,-7],[3,-4],[9,-5],[-2,-5],[-1,-3],[1,-3],[9,-14],[5,-7],[1,-8],[1,-4],[-1,-5],[-1,-5],[0,-5],[2,-2],[-1,-3],[0,-5],[-1,-3],[-1,-2],[-4,-3],[-1,-1],[-7,-15],[-3,-3],[-1,-3],[-1,-5],[0,-5],[1,-5],[3,-2],[6,6],[3,-2],[-1,0],[-3,-3],[3,-3],[-2,-3],[-8,-5],[-12,-11],[-2,-2],[-2,-6],[-2,-2],[-2,-1],[-2,2],[-1,3],[-2,1],[-4,-3],[1,-5],[2,-7],[0,-6],[2,0],[3,2],[2,1],[2,0],[3,-2],[5,1],[0,-1],[-1,-2],[0,-2],[0,-4],[1,-2],[1,-1],[3,-2],[4,-2],[0,-1],[-1,-1],[0,-2],[1,-5],[0,-2],[-1,-2],[-1,-2],[-3,0],[-2,-1],[-1,-3],[0,-2],[0,-2],[-1,-3],[-2,-2],[-2,1],[1,-3],[1,-2],[1,-1],[1,-2],[0,-3],[-3,-1],[-9,1],[-2,0],[-1,1],[-12,0],[-1,1],[-3,3],[-1,1],[-1,-1],[-2,-3],[0,-1],[-2,0],[-1,0],[-3,2],[2,5],[0,3],[-2,1],[-3,1],[-1,1],[-2,2],[-2,3],[0,6],[9,12],[2,1],[1,0],[1,1],[2,3],[2,5],[1,3],[-1,1],[-1,0],[-3,-1],[5,10],[2,6],[-2,3],[1,3],[0,2],[1,1],[2,-2],[1,2],[1,2],[1,3],[-1,1],[0,1],[0,1],[1,0],[2,1],[1,0],[1,1],[-3,4],[1,3],[1,2],[0,1],[-1,3],[-2,0],[-4,-1],[-2,2],[-3,4],[-2,1],[-2,1],[-5,-2],[-3,0],[-1,1],[-1,2],[-2,2],[-8,2],[-2,2]],[[9936,9775],[-3,-2],[1,-3],[0,-2],[0,-2],[0,-2],[1,-1],[4,-4],[-7,-4],[-3,-1],[2,-3],[0,-5],[1,-4],[0,-4],[3,-3],[4,-2],[10,-2],[7,-2],[4,-1],[3,0],[3,1],[2,2],[0,1],[1,1],[8,-15],[2,-6],[-1,-9],[-3,-7],[-1,-3],[0,-5],[1,-5],[1,-2],[1,0],[-1,-2],[-6,-4],[-1,-1],[-3,-6],[-3,-3],[-5,-2],[-3,-3],[-3,-7],[-2,-2],[-7,-1]],[[9823,9750],[-3,13],[-2,2],[0,3],[2,1],[0,1],[7,3],[1,0],[1,0],[2,-1],[2,0],[6,3],[4,2],[-3,4],[-2,2],[-6,2],[-1,0],[0,1],[1,1],[1,1],[0,2],[-1,6],[-2,6],[-1,2],[-1,2],[-6,6],[-10,5]],[[9541,9469],[3,-2],[5,0],[5,-1],[3,0],[13,7],[2,2],[1,5],[1,2],[3,0],[3,-2],[2,-1],[1,-1],[1,-4],[1,-2],[2,0],[3,-1],[1,-1],[1,0],[5,-1],[2,4],[1,1],[2,0],[3,-2],[0,-1],[-1,-6],[0,-2],[-6,-8],[-6,-6],[-17,-10],[-6,-5],[-3,-1],[-15,0],[-2,0],[-2,3],[0,3],[0,2],[-1,3],[-2,2],[-16,6],[-4,1],[-3,0],[-5,-1],[-2,-1],[-2,0],[-2,-2],[0,-3],[0,-3],[0,-2],[-6,-1],[-4,0],[-3,2],[-1,1],[-4,4],[-1,6],[0,5],[0,6],[-1,10],[21,7],[2,2],[2,1],[9,-7],[13,-4],[4,-4]],[[9607,9508],[-5,1],[-6,3],[-2,0],[-4,0],[-2,0],[-3,2],[-11,11],[8,4],[3,1],[12,0],[3,-2],[3,-3]],[[9613,9472],[-2,0],[-1,1],[-1,3],[0,3],[0,2],[-1,2],[-1,1],[-1,-2],[-3,-1],[-12,0],[-3,1],[-3,2],[-7,7],[-2,1],[-6,1],[-1,-1],[-4,-9],[-2,-2],[-2,-2],[-5,0],[-1,-1],[-2,-1],[-1,1],[-4,4],[-8,5],[-5,6],[-2,0],[-6,-3],[-3,0],[-7,2],[-2,2],[-2,3],[-2,4],[-2,3],[-4,4],[-2,3],[0,4],[1,2],[14,9],[35,5],[3,-1],[2,-1],[2,-2],[2,-3],[2,-4],[-2,0],[-2,-2],[-1,-1],[0,-2],[13,-1],[6,-3],[6,-5],[1,-4],[3,-8],[2,-4],[3,-1],[7,2],[3,-2],[2,1],[4,0],[2,0]],[[9601,9532],[-6,0],[-1,1],[-1,1],[-1,1],[-1,2],[0,2]],[[9578,9552],[1,-1],[1,-1],[1,-2],[5,-1],[3,-2],[0,-4],[-1,-3],[-2,-1],[-3,-2],[-10,-2],[-2,0],[-5,2],[-3,3],[-1,3],[-1,3],[-2,2],[-5,2],[-1,1],[-1,2],[-1,1],[-2,0],[-3,-5],[-1,0],[-6,-1],[-3,1],[-1,3],[0,8],[5,3],[11,2],[3,0],[1,-1],[13,0],[3,-1],[2,-2],[5,-7]]],transform:{scale:[.007562345672167208,.004154020545354537],translate:[-68.41738847599987,12.022040106000105]}},m.prototype.nplTopo="__NPL__",m.prototype.nruTopo="__NRU__",m.prototype.nulTopo="__NUL__",m.prototype.nzlTopo="__NZL__",m.prototype.omnTopo="__OMN__",m.prototype.pakTopo="__PAK__",m.prototype.panTopo="__PAN__",m.prototype.pcnTopo="__PCN__",m.prototype.perTopo="__PER__",m.prototype.pgaTopo="__PGA__",m.prototype.phlTopo="__PHL__",m.prototype.plwTopo="__PLW__",m.prototype.pngTopo="__PNG__",m.prototype.polTopo="__POL__",m.prototype.priTopo="__PRI__",m.prototype.prkTopo="__PRK__",m.prototype.prtTopo="__PRT__",m.prototype.pryTopo="__PRY__",m.prototype.pyfTopo="__PYF__",m.prototype.qatTopo="__QAT__",m.prototype.rouTopo="__ROU__",m.prototype.rusTopo="__RUS__",m.prototype.rwaTopo="__RWA__",m.prototype.sahTopo="__SAH__",m.prototype.sauTopo="__SAU__",m.prototype.scrTopo="__SCR__",m.prototype.sdnTopo="__SDN__",m.prototype.sdsTopo="__SDS__",m.prototype.senTopo="__SEN__",m.prototype.serTopo="__SER__",m.prototype.sgpTopo="__SGP__",m.prototype.sgsTopo="__SGS__",m.prototype.shnTopo="__SHN__",m.prototype.slbTopo="__SLB__",m.prototype.sleTopo="__SLE__",m.prototype.slvTopo="__SLV__",m.prototype.smrTopo="__SMR__",m.prototype.solTopo="__SOL__",m.prototype.somTopo="__SOM__",m.prototype.spmTopo="__SPM__",m.prototype.srbTopo="__SRB__",m.prototype.stpTopo="__STP__",m.prototype.surTopo="__SUR__",m.prototype.svkTopo="__SVK__",m.prototype.svnTopo="__SVN__",m.prototype.sweTopo="__SWE__",m.prototype.swzTopo="__SWZ__",m.prototype.sxmTopo="__SXM__",m.prototype.sycTopo="__SYC__",m.prototype.syrTopo="__SYR__",
m.prototype.tcaTopo="__TCA__",m.prototype.tcdTopo="__TCD__",m.prototype.tgoTopo="__TGO__",m.prototype.thaTopo="__THA__",m.prototype.tjkTopo="__TJK__",m.prototype.tkmTopo="__TKM__",m.prototype.tlsTopo="__TLS__",m.prototype.tonTopo="__TON__",m.prototype.ttoTopo="__TTO__",m.prototype.tunTopo="__TUN__",m.prototype.turTopo="__TUR__",m.prototype.tuvTopo="__TUV__",m.prototype.twnTopo="__TWN__",m.prototype.tzaTopo="__TZA__",m.prototype.ugaTopo="__UGA__",m.prototype.ukrTopo="__UKR__",m.prototype.umiTopo="__UMI__",m.prototype.uryTopo="__URY__",m.prototype.usaTopo="__USA__",m.prototype.usgTopo="__USG__",m.prototype.uzbTopo="__UZB__",m.prototype.vatTopo="__VAT__",m.prototype.vctTopo="__VCT__",m.prototype.venTopo="__VEN__",m.prototype.vgbTopo="__VGB__",m.prototype.virTopo="__VIR__",m.prototype.vnmTopo="__VNM__",m.prototype.vutTopo="__VUT__",m.prototype.wlfTopo="__WLF__",m.prototype.wsbTopo="__WSB__",m.prototype.wsmTopo="__WSM__",m.prototype.yemTopo="__YEM__",m.prototype.zafTopo="__ZAF__",m.prototype.zmbTopo="__ZMB__",m.prototype.zweTopo="__ZWE__",m.prototype.latLngToXY=function(a,b){return this.projection([b,a])},m.prototype.addLayer=function(a,b,c){var d;return d=c?this.svg.insert("g",":first-child"):this.svg.append("g"),d.attr("id",b||"").attr("class",a||"")},m.prototype.updateChoropleth=function(a){var b=this.svg;for(var c in a)if(a.hasOwnProperty(c)){var d,e=a[c];if(!c)continue;if(d="string"==typeof e?e:"string"==typeof e.color?e.color:this.options.fills[e.fillKey],e===Object(e)){this.options.data[c]=l(e,this.options.data[c]||{});this.svg.select("."+c).attr("data-info",JSON.stringify(this.options.data[c]))}b.selectAll("."+c).transition().style("fill",d)}},m.prototype.updatePopup=function(a,b,c){var d=this;a.on("mousemove",null),a.on("mousemove",function(){var e=n.mouse(d.options.element);n.select(d.svg[0][0].parentNode).select(".datamaps-hoverover").style("top",e[1]+30+"px").html(function(){var d=JSON.parse(a.attr("data-info"));try{return c.popupTemplate(b,d)}catch(e){return""}}).style("left",e[0]+"px")}),n.select(d.svg[0][0].parentNode).select(".datamaps-hoverover").style("display","block")},m.prototype.addPlugin=function(a,b){var c=this;"undefined"==typeof m.prototype[a]&&(m.prototype[a]=function(d,e,f,g){var h;"undefined"==typeof g&&(g=!1),"function"==typeof e&&(f=e,e=void 0),e=l(e||{},c.options[a+"Config"]),!g&&this.options[a+"Layer"]?(h=this.options[a+"Layer"],e=e||this.options[a+"Options"]):(h=this.addLayer(a),this.options[a+"Layer"]=h,this.options[a+"Options"]=e),b.apply(this,[h,d,e]),f&&f(h)})},"object"==typeof exports?(n=require("d3"),o=require("topojson"),module.exports=m):"function"==typeof define&&define.amd?define("datamaps",["require","d3","topojson"],function(a){return n=a("d3"),o=a("topojson"),m}):window.Datamap=window.Datamaps=m,window.jQuery&&(window.jQuery.fn.datamaps=function(a,b){a=a||{},a.element=this[0];var c=new m(a);return"function"==typeof b&&b(c,a),this})}();