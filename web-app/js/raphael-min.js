/*
 * Raphael 1.3.2 - JavaScript Vector Library
 *
 * Copyright (c) 2009 Dmitry Baranovskiy (http://raphaeljs.com)
 * Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) license.
 */
Raphael = (function() {
	var a = /[, ]+/, aY = /^(circle|rect|path|ellipse|text|image)$/, a9 = "prototype", W = "hasOwnProperty", P = document, aB = window, m = {
		was : Object[a9][W].call(aB, "Raphael"),
		is : aB.Raphael
	}, au = function() {
		if (au.is(arguments[0], "array")) {
			var d = arguments[0], e = z[a7](au, d
					.splice(0, 3 + au.is(d[0], aq))), S = e.set();
			for ( var R = 0, bc = d[n]; R < bc; R++) {
				var E = d[R] || {};
				aY.test(E.type) && S[f](e[E.type]().attr(E))
			}
			return S
		}
		return z[a7](au, arguments)
	}, a4 = function() {
	}, aU = "appendChild", a7 = "apply", a2 = "concat", aA = "", at = " ", C = "split", J = "click dblclick mousedown mousemove mouseout mouseover mouseup"[C]
			(at), aH = "join", n = "length", bb = String[a9].toLowerCase, af = Math, h = af.max, aR = af.min, aq = "number", aJ = "toString", aE = Object[a9][aJ], a0 = {}, aV = af.pow, f = "push", a5 = /^(?=[\da-f]$)/, c = /^url\(['"]?([^\)]+?)['"]?\)$/i, A = /^\s*((#[a-f\d]{6})|(#[a-f\d]{3})|rgb\(\s*([\d\.]+\s*,\s*[\d\.]+\s*,\s*[\d\.]+)\s*\)|rgb\(\s*([\d\.]+%\s*,\s*[\d\.]+%\s*,\s*[\d\.]+%)\s*\)|hs[bl]\(\s*([\d\.]+\s*,\s*[\d\.]+\s*,\s*[\d\.]+)\s*\)|hs[bl]\(\s*([\d\.]+%\s*,\s*[\d\.]+%\s*,\s*[\d\.]+%)\s*\))\s*$/i, U = af.round, y = "setAttribute", aa = parseFloat, K = parseInt, aX = String[a9].toUpperCase, k = {
		blur : 0,
		"clip-rect" : "0 0 1e9 1e9",
		cursor : "default",
		cx : 0,
		cy : 0,
		fill : "#fff",
		"fill-opacity" : 1,
		font : '10px "Arial"',
		"font-family" : '"Arial"',
		"font-size" : "10",
		"font-style" : "normal",
		"font-weight" : 400,
		gradient : 0,
		height : 0,
		href : "http://raphaeljs.com/",
		opacity : 1,
		path : "M0,0",
		r : 0,
		rotation : 0,
		rx : 0,
		ry : 0,
		scale : "1 1",
		src : "",
		stroke : "#000",
		"stroke-dasharray" : "",
		"stroke-linecap" : "butt",
		"stroke-linejoin" : "butt",
		"stroke-miterlimit" : 0,
		"stroke-opacity" : 1,
		"stroke-width" : 1,
		target : "_blank",
		"text-anchor" : "middle",
		title : "Raphael",
		translation : "0 0",
		width : 0,
		x : 0,
		y : 0
	}, ad = {
		along : "along",
		blur : aq,
		"clip-rect" : "csv",
		cx : aq,
		cy : aq,
		fill : "colour",
		"fill-opacity" : aq,
		"font-size" : aq,
		height : aq,
		opacity : aq,
		path : "path",
		r : aq,
		rotation : "csv",
		rx : aq,
		ry : aq,
		scale : "csv",
		stroke : "colour",
		"stroke-opacity" : aq,
		"stroke-width" : aq,
		translation : "csv",
		width : aq,
		x : aq,
		y : aq
	}, aZ = "replace";
	au.version = "1.3.2";
	au.type = (aB.SVGAngle
			|| P.implementation.hasFeature(
					"http://www.w3.org/TR/SVG11/feature#BasicStructure", "1.1") ? "SVG"
			: "VML");
	if (au.type == "VML") {
		var ak = P.createElement("div");
		ak.innerHTML = "<!--[if vml]><br><br><![endif]-->";
		ak = null
	}
	au.svg = !(au.vml = au.type == "VML");
	a4[a9] = au[a9];
	au._id = 0;
	au._oid = 0;
	au.fn = {};
	au.is = function(e, d) {
		d = bb.call(d);
		return ((d == "object" || d == "undefined") && typeof e == d)
				|| (e == null && d == "null")
				|| bb.call(aE.call(e).slice(8, -1)) == d
	};
	au.setWindow = function(d) {
		aB = d;
		P = aB.document
	};
	var aM = function(e) {
		if (au.vml) {
			var d = /^\s+|\s+$/g;
			aM = an(function(R) {
				var S;
				R = (R + aA)[aZ](d, aA);
				try {
					var bc = new aB.ActiveXObject("htmlfile");
					bc.write("<body>");
					bc.close();
					S = bc.body
				} catch (be) {
					S = aB.createPopup().document.body
				}
				var i = S.createTextRange();
				try {
					S.style.color = R;
					var bd = i.queryCommandValue("ForeColor");
					bd = ((bd & 255) << 16) | (bd & 65280)
							| ((bd & 16711680) >>> 16);
					return "#" + ("000000" + bd[aJ](16)).slice(-6)
				} catch (be) {
					return "none"
				}
			})
		} else {
			var E = P.createElement("i");
			E.title = "Rapha\xebl Colour Picker";
			E.style.display = "none";
			P.body[aU](E);
			aM = an(function(i) {
				E.style.color = i;
				return P.defaultView.getComputedStyle(E, aA).getPropertyValue(
						"color")
			})
		}
		return aM(e)
	};
	var ao = function() {
		return "hsb(" + [ this.h, this.s, this.b ] + ")"
	}, w = function() {
		return this.hex
	};
	au.hsb2rgb = an(function(bf, bd, bj) {
		if (au.is(bf, "object") && "h" in bf && "s" in bf && "b" in bf) {
			bj = bf.b;
			bd = bf.s;
			bf = bf.h
		}
		var R, S, bk;
		if (bj == 0) {
			return {
				r : 0,
				g : 0,
				b : 0,
				hex : "#000"
			}
		}
		if (bf > 1 || bd > 1 || bj > 1) {
			bf /= 255;
			bd /= 255;
			bj /= 255
		}
		var bc = ~~(bf * 6), bg = (bf * 6) - bc, E = bj * (1 - bd), e = bj
				* (1 - (bd * bg)), bl = bj * (1 - (bd * (1 - bg)));
		R = [ bj, e, E, E, bl, bj, bj ][bc];
		S = [ bl, bj, bj, e, E, E, bl ][bc];
		bk = [ E, E, bl, bj, bj, e, E ][bc];
		R *= 255;
		S *= 255;
		bk *= 255;
		var bh = {
			r : R,
			g : S,
			b : bk,
			toString : w
		}, d = (~~R)[aJ](16), be = (~~S)[aJ](16), bi = (~~bk)[aJ](16);
		d = d[aZ](a5, "0");
		be = be[aZ](a5, "0");
		bi = bi[aZ](a5, "0");
		bh.hex = "#" + d + be + bi;
		return bh
	}, au);
	au.rgb2hsb = an(function(d, e, bd) {
		if (au.is(d, "object") && "r" in d && "g" in d && "b" in d) {
			bd = d.b;
			e = d.g;
			d = d.r
		}
		if (au.is(d, "string")) {
			var bf = au.getRGB(d);
			d = bf.r;
			e = bf.g;
			bd = bf.b
		}
		if (d > 1 || e > 1 || bd > 1) {
			d /= 255;
			e /= 255;
			bd /= 255
		}
		var bc = h(d, e, bd), i = aR(d, e, bd), R, E, S = bc;
		if (i == bc) {
			return {
				h : 0,
				s : 0,
				b : bc
			}
		} else {
			var be = (bc - i);
			E = be / bc;
			if (d == bc) {
				R = (e - bd) / be
			} else {
				if (e == bc) {
					R = 2 + ((bd - d) / be)
				} else {
					R = 4 + ((d - e) / be)
				}
			}
			R /= 6;
			R < 0 && R++;
			R > 1 && R--
		}
		return {
			h : R,
			s : E,
			b : S,
			toString : ao
		}
	}, au);
	var aN = /,?([achlmqrstvxz]),?/gi;
	au._path2string = function() {
		return this.join(",")[aZ](aN, "$1")
	};
	function an(E, e, d) {
		function i() {
			var R = Array[a9].slice.call(arguments, 0), bc = R[aH]("\u25ba"), S = i.cache = i.cache
					|| {}, bd = i.count = i.count || [];
			if (S[W](bc)) {
				return d ? d(S[bc]) : S[bc]
			}
			bd[n] >= 1000 && delete S[bd.shift()];
			bd[f](bc);
			S[bc] = E[a7](e, R);
			return d ? d(S[bc]) : S[bc]
		}
		return i
	}
	au.getRGB = an(function(d) {
		if (!d || !!((d = d + aA).indexOf("-") + 1)) {
			return {
				r : -1,
				g : -1,
				b : -1,
				hex : "none",
				error : 1
			}
		}
		if (d == "none") {
			return {
				r : -1,
				g : -1,
				b : -1,
				hex : "none"
			}
		}
		!(({
			hs : 1,
			rg : 1
		})[W](d.substring(0, 2)) || d.charAt() == "#") && (d = aM(d));
		var S, i, E, be, bf, bc = d.match(A);
		if (bc) {
			if (bc[2]) {
				be = K(bc[2].substring(5), 16);
				E = K(bc[2].substring(3, 5), 16);
				i = K(bc[2].substring(1, 3), 16)
			}
			if (bc[3]) {
				be = K((bf = bc[3].charAt(3)) + bf, 16);
				E = K((bf = bc[3].charAt(2)) + bf, 16);
				i = K((bf = bc[3].charAt(1)) + bf, 16)
			}
			if (bc[4]) {
				bc = bc[4][C](/\s*,\s*/);
				i = aa(bc[0]);
				E = aa(bc[1]);
				be = aa(bc[2])
			}
			if (bc[5]) {
				bc = bc[5][C](/\s*,\s*/);
				i = aa(bc[0]) * 2.55;
				E = aa(bc[1]) * 2.55;
				be = aa(bc[2]) * 2.55
			}
			if (bc[6]) {
				bc = bc[6][C](/\s*,\s*/);
				i = aa(bc[0]);
				E = aa(bc[1]);
				be = aa(bc[2]);
				return au.hsb2rgb(i, E, be)
			}
			if (bc[7]) {
				bc = bc[7][C](/\s*,\s*/);
				i = aa(bc[0]) * 2.55;
				E = aa(bc[1]) * 2.55;
				be = aa(bc[2]) * 2.55;
				return au.hsb2rgb(i, E, be)
			}
			bc = {
				r : i,
				g : E,
				b : be
			};
			var e = (~~i)[aJ](16), R = (~~E)[aJ](16), bd = (~~be)[aJ](16);
			e = e[aZ](a5, "0");
			R = R[aZ](a5, "0");
			bd = bd[aZ](a5, "0");
			bc.hex = "#" + e + R + bd;
			return bc
		}
		return {
			r : -1,
			g : -1,
			b : -1,
			hex : "none",
			error : 1
		}
	}, au);
	au.getColor = function(e) {
		var i = this.getColor.start = this.getColor.start || {
			h : 0,
			s : 1,
			b : e || 0.75
		}, d = this.hsb2rgb(i.h, i.s, i.b);
		i.h += 0.075;
		if (i.h > 1) {
			i.h = 0;
			i.s -= 0.2;
			i.s <= 0 && (this.getColor.start = {
				h : 0,
				s : 1,
				b : i.b
			})
		}
		return d.hex
	};
	au.getColor.reset = function() {
		delete this.start
	};
	var aC = /([achlmqstvz])[\s,]*((-?\d*\.?\d*(?:e[-+]?\d+)?\s*,?\s*)+)/ig, ar = /(-?\d*\.?\d*(?:e[-+]?\d+)?)\s*,?\s*/ig;
	au.parsePathString = an(function(d) {
		if (!d) {
			return null
		}
		var i = {
			a : 7,
			c : 6,
			h : 1,
			l : 2,
			m : 2,
			q : 4,
			s : 4,
			t : 2,
			v : 1,
			z : 0
		}, e = [];
		if (au.is(d, "array") && au.is(d[0], "array")) {
			e = aD(d)
		}
		if (!e[n]) {
			(d + aA)[aZ](aC, function(R, E, bd) {
				var bc = [], S = bb.call(E);
				bd[aZ](ar, function(bf, be) {
					be && bc[f](+be)
				});
				if (S == "m" && bc[n] > 2) {
					e[f]([ E ][a2](bc.splice(0, 2)));
					S = "l";
					E = E == "m" ? "l" : "L"
				}
				while (bc[n] >= i[S]) {
					e[f]([ E ][a2](bc.splice(0, i[S])));
					if (!i[S]) {
						break
					}
				}
			})
		}
		e[aJ] = au._path2string;
		return e
	});
	au.findDotsAtSegment = function(e, d, bq, bo, bc, R, be, bd, bk) {
		var bi = 1 - bk, bh = aV(bi, 3) * e + aV(bi, 2) * 3 * bk * bq + bi * 3
				* bk * bk * bc + aV(bk, 3) * be, bf = aV(bi, 3) * d + aV(bi, 2)
				* 3 * bk * bo + bi * 3 * bk * bk * R + aV(bk, 3) * bd, bm = e
				+ 2 * bk * (bq - e) + bk * bk * (bc - 2 * bq + e), bl = d + 2
				* bk * (bo - d) + bk * bk * (R - 2 * bo + d), bp = bq + 2 * bk
				* (bc - bq) + bk * bk * (be - 2 * bc + bq), bn = bo + 2 * bk
				* (R - bo) + bk * bk * (bd - 2 * R + bo), bj = (1 - bk) * e
				+ bk * bq, bg = (1 - bk) * d + bk * bo, E = (1 - bk) * bc + bk
				* be, i = (1 - bk) * R + bk * bd, S = (90 - af.atan((bm - bp)
				/ (bl - bn))
				* 180 / af.PI);
		(bm > bp || bl < bn) && (S += 180);
		return {
			x : bh,
			y : bf,
			m : {
				x : bm,
				y : bl
			},
			n : {
				x : bp,
				y : bn
			},
			start : {
				x : bj,
				y : bg
			},
			end : {
				x : E,
				y : i
			},
			alpha : S
		}
	};
	var Y = an(function(bh) {
		if (!bh) {
			return {
				x : 0,
				y : 0,
				width : 0,
				height : 0
			}
		}
		bh = L(bh);
		var be = 0, bd = 0, R = [], e = [], E;
		for ( var S = 0, bg = bh[n]; S < bg; S++) {
			E = bh[S];
			if (E[0] == "M") {
				be = E[1];
				bd = E[2];
				R[f](be);
				e[f](bd)
			} else {
				var bc = aL(be, bd, E[1], E[2], E[3], E[4], E[5], E[6]);
				R = R[a2](bc.min.x, bc.max.x);
				e = e[a2](bc.min.y, bc.max.y);
				be = E[5];
				bd = E[6]
			}
		}
		var d = aR[a7](0, R), bf = aR[a7](0, e);
		return {
			x : d,
			y : bf,
			width : h[a7](0, R) - d,
			height : h[a7](0, e) - bf
		}
	}), aD = function(bc) {
		var E = [];
		if (!au.is(bc, "array") || !au.is(bc && bc[0], "array")) {
			bc = au.parsePathString(bc)
		}
		for ( var e = 0, R = bc[n]; e < R; e++) {
			E[e] = [];
			for ( var d = 0, S = bc[e][n]; d < S; d++) {
				E[e][d] = bc[e][d]
			}
		}
		E[aJ] = au._path2string;
		return E
	}, ah = an(function(R) {
		if (!au.is(R, "array") || !au.is(R && R[0], "array")) {
			R = au.parsePathString(R)
		}
		var bg = [], bi = 0, bh = 0, bl = 0, bk = 0, E = 0;
		if (R[0][0] == "M") {
			bi = R[0][1];
			bh = R[0][2];
			bl = bi;
			bk = bh;
			E++;
			bg[f]([ "M", bi, bh ])
		}
		for ( var bd = E, bm = R[n]; bd < bm; bd++) {
			var d = bg[bd] = [], bj = R[bd];
			if (bj[0] != bb.call(bj[0])) {
				d[0] = bb.call(bj[0]);
				switch (d[0]) {
				case "a":
					d[1] = bj[1];
					d[2] = bj[2];
					d[3] = bj[3];
					d[4] = bj[4];
					d[5] = bj[5];
					d[6] = +(bj[6] - bi).toFixed(3);
					d[7] = +(bj[7] - bh).toFixed(3);
					break;
				case "v":
					d[1] = +(bj[1] - bh).toFixed(3);
					break;
				case "m":
					bl = bj[1];
					bk = bj[2];
				default:
					for ( var bc = 1, be = bj[n]; bc < be; bc++) {
						d[bc] = +(bj[bc] - ((bc % 2) ? bi : bh)).toFixed(3)
					}
				}
			} else {
				d = bg[bd] = [];
				if (bj[0] == "m") {
					bl = bj[1] + bi;
					bk = bj[2] + bh
				}
				for ( var S = 0, e = bj[n]; S < e; S++) {
					bg[bd][S] = bj[S]
				}
			}
			var bf = bg[bd][n];
			switch (bg[bd][0]) {
			case "z":
				bi = bl;
				bh = bk;
				break;
			case "h":
				bi += +bg[bd][bf - 1];
				break;
			case "v":
				bh += +bg[bd][bf - 1];
				break;
			default:
				bi += +bg[bd][bf - 2];
				bh += +bg[bd][bf - 1]
			}
		}
		bg[aJ] = au._path2string;
		return bg
	}, 0, aD), t = an(function(R) {
		if (!au.is(R, "array") || !au.is(R && R[0], "array")) {
			R = au.parsePathString(R)
		}
		var bf = [], bh = 0, bg = 0, bk = 0, bj = 0, E = 0;
		if (R[0][0] == "M") {
			bh = +R[0][1];
			bg = +R[0][2];
			bk = bh;
			bj = bg;
			E++;
			bf[0] = [ "M", bh, bg ]
		}
		for ( var bd = E, bl = R[n]; bd < bl; bd++) {
			var d = bf[bd] = [], bi = R[bd];
			if (bi[0] != aX.call(bi[0])) {
				d[0] = aX.call(bi[0]);
				switch (d[0]) {
				case "A":
					d[1] = bi[1];
					d[2] = bi[2];
					d[3] = bi[3];
					d[4] = bi[4];
					d[5] = bi[5];
					d[6] = +(bi[6] + bh);
					d[7] = +(bi[7] + bg);
					break;
				case "V":
					d[1] = +bi[1] + bg;
					break;
				case "H":
					d[1] = +bi[1] + bh;
					break;
				case "M":
					bk = +bi[1] + bh;
					bj = +bi[2] + bg;
				default:
					for ( var bc = 1, be = bi[n]; bc < be; bc++) {
						d[bc] = +bi[bc] + ((bc % 2) ? bh : bg)
					}
				}
			} else {
				for ( var S = 0, e = bi[n]; S < e; S++) {
					bf[bd][S] = bi[S]
				}
			}
			switch (d[0]) {
			case "Z":
				bh = bk;
				bg = bj;
				break;
			case "H":
				bh = d[1];
				break;
			case "V":
				bg = d[1];
				break;
			default:
				bh = bf[bd][bf[bd][n] - 2];
				bg = bf[bd][bf[bd][n] - 1]
			}
		}
		bf[aJ] = au._path2string;
		return bf
	}, null, aD), a8 = function(e, E, d, i) {
		return [ e, E, d, i, d, i ]
	}, aT = function(e, E, bc, R, d, i) {
		var S = 1 / 3, bd = 2 / 3;
		return [ S * e + bd * bc, S * E + bd * R, S * d + bd * bc,
				S * i + bd * R, d, i ]
	}, O = function(bl, bQ, bu, bs, bm, bg, S, bk, bP, bn) {
		var R = af.PI, br = R * 120 / 180, d = R / 180 * (+bm || 0), by = [], bv, bM = an(function(
				bR, bU, i) {
			var bT = bR * af.cos(i) - bU * af.sin(i), bS = bR * af.sin(i) + bU
					* af.cos(i);
			return {
				x : bT,
				y : bS
			}
		});
		if (!bn) {
			bv = bM(bl, bQ, -d);
			bl = bv.x;
			bQ = bv.y;
			bv = bM(bk, bP, -d);
			bk = bv.x;
			bP = bv.y;
			var e = af.cos(R / 180 * bm), bi = af.sin(R / 180 * bm), bA = (bl - bk) / 2, bz = (bQ - bP) / 2;
			var bK = (bA * bA) / (bu * bu) + (bz * bz) / (bs * bs);
			if (bK > 1) {
				bK = af.sqrt(bK);
				bu = bK * bu;
				bs = bK * bs
			}
			var E = bu * bu, bD = bs * bs, bF = (bg == S ? -1 : 1)
					* af.sqrt(af.abs((E * bD - E * bz * bz - bD * bA * bA)
							/ (E * bz * bz + bD * bA * bA))), bp = bF * bu * bz
					/ bs + (bl + bk) / 2, bo = bF * -bs * bA / bu + (bQ + bP)
					/ 2, bf = af.asin(((bQ - bo) / bs).toFixed(7)), be = af
					.asin(((bP - bo) / bs).toFixed(7));
			bf = bl < bp ? R - bf : bf;
			be = bk < bp ? R - be : be;
			bf < 0 && (bf = R * 2 + bf);
			be < 0 && (be = R * 2 + be);
			if (S && bf > be) {
				bf = bf - R * 2
			}
			if (!S && be > bf) {
				be = be - R * 2
			}
		} else {
			bf = bn[0];
			be = bn[1];
			bp = bn[2];
			bo = bn[3]
		}
		var bj = be - bf;
		if (af.abs(bj) > br) {
			var bq = be, bt = bk, bh = bP;
			be = bf + br * (S && be > bf ? 1 : -1);
			bk = bp + bu * af.cos(be);
			bP = bo + bs * af.sin(be);
			by = O(bk, bP, bu, bs, bm, 0, S, bt, bh, [ be, bq, bp, bo ])
		}
		bj = be - bf;
		var bd = af.cos(bf), bO = af.sin(bf), bc = af.cos(be), bN = af.sin(be), bB = af
				.tan(bj / 4), bE = 4 / 3 * bu * bB, bC = 4 / 3 * bs * bB, bL = [
				bl, bQ ], bJ = [ bl + bE * bO, bQ - bC * bd ], bI = [
				bk + bE * bN, bP - bC * bc ], bG = [ bk, bP ];
		bJ[0] = 2 * bL[0] - bJ[0];
		bJ[1] = 2 * bL[1] - bJ[1];
		if (bn) {
			return [ bJ, bI, bG ][a2](by)
		} else {
			by = [ bJ, bI, bG ][a2](by)[aH]()[C](",");
			var bw = [];
			for ( var bH = 0, bx = by[n]; bH < bx; bH++) {
				bw[bH] = bH % 2 ? bM(by[bH - 1], by[bH], d).y : bM(by[bH],
						by[bH + 1], d).x
			}
			return bw
		}
	}, T = function(e, d, E, i, be, bd, bc, S, bf) {
		var R = 1 - bf;
		return {
			x : aV(R, 3) * e + aV(R, 2) * 3 * bf * E + R * 3 * bf * bf * be
					+ aV(bf, 3) * bc,
			y : aV(R, 3) * d + aV(R, 2) * 3 * bf * i + R * 3 * bf * bf * bd
					+ aV(bf, 3) * S
		}
	}, aL = an(function(i, d, R, E, bl, bk, bh, be) {
		var bj = (bl - 2 * R + i) - (bh - 2 * bl + R), bg = 2 * (R - i) - 2
				* (bl - R), bd = i - R, bc = (-bg + af.sqrt(bg * bg - 4 * bj
				* bd))
				/ 2 / bj, S = (-bg - af.sqrt(bg * bg - 4 * bj * bd)) / 2 / bj, bf = [
				d, be ], bi = [ i, bh ], e;
		af.abs(bc) > 1000000000000 && (bc = 0.5);
		af.abs(S) > 1000000000000 && (S = 0.5);
		if (bc > 0 && bc < 1) {
			e = T(i, d, R, E, bl, bk, bh, be, bc);
			bi[f](e.x);
			bf[f](e.y)
		}
		if (S > 0 && S < 1) {
			e = T(i, d, R, E, bl, bk, bh, be, S);
			bi[f](e.x);
			bf[f](e.y)
		}
		bj = (bk - 2 * E + d) - (be - 2 * bk + E);
		bg = 2 * (E - d) - 2 * (bk - E);
		bd = d - E;
		bc = (-bg + af.sqrt(bg * bg - 4 * bj * bd)) / 2 / bj;
		S = (-bg - af.sqrt(bg * bg - 4 * bj * bd)) / 2 / bj;
		af.abs(bc) > 1000000000000 && (bc = 0.5);
		af.abs(S) > 1000000000000 && (S = 0.5);
		if (bc > 0 && bc < 1) {
			e = T(i, d, R, E, bl, bk, bh, be, bc);
			bi[f](e.x);
			bf[f](e.y)
		}
		if (S > 0 && S < 1) {
			e = T(i, d, R, E, bl, bk, bh, be, S);
			bi[f](e.x);
			bf[f](e.y)
		}
		return {
			min : {
				x : aR[a7](0, bi),
				y : aR[a7](0, bf)
			},
			max : {
				x : h[a7](0, bi),
				y : h[a7](0, bf)
			}
		}
	}), L = an(function(bl, bg) {
		var R = t(bl), bh = bg && t(bg), bi = {
			x : 0,
			y : 0,
			bx : 0,
			by : 0,
			X : 0,
			Y : 0,
			qx : null,
			qy : null
		}, d = {
			x : 0,
			y : 0,
			bx : 0,
			by : 0,
			X : 0,
			Y : 0,
			qx : null,
			qy : null
		}, bc = function(bm, bn) {
			var i, bo;
			if (!bm) {
				return [ "C", bn.x, bn.y, bn.x, bn.y, bn.x, bn.y ]
			}
			!(bm[0] in {
				T : 1,
				Q : 1
			}) && (bn.qx = bn.qy = null);
			switch (bm[0]) {
			case "M":
				bn.X = bm[1];
				bn.Y = bm[2];
				break;
			case "A":
				bm = [ "C" ][a2](O[a7](0, [ bn.x, bn.y ][a2](bm.slice(1))));
				break;
			case "S":
				i = bn.x + (bn.x - (bn.bx || bn.x));
				bo = bn.y + (bn.y - (bn.by || bn.y));
				bm = [ "C", i, bo ][a2](bm.slice(1));
				break;
			case "T":
				bn.qx = bn.x + (bn.x - (bn.qx || bn.x));
				bn.qy = bn.y + (bn.y - (bn.qy || bn.y));
				bm = [ "C" ][a2](aT(bn.x, bn.y, bn.qx, bn.qy, bm[1], bm[2]));
				break;
			case "Q":
				bn.qx = bm[1];
				bn.qy = bm[2];
				bm = [ "C" ][a2](aT(bn.x, bn.y, bm[1], bm[2], bm[3], bm[4]));
				break;
			case "L":
				bm = [ "C" ][a2](a8(bn.x, bn.y, bm[1], bm[2]));
				break;
			case "H":
				bm = [ "C" ][a2](a8(bn.x, bn.y, bm[1], bn.y));
				break;
			case "V":
				bm = [ "C" ][a2](a8(bn.x, bn.y, bn.x, bm[1]));
				break;
			case "Z":
				bm = [ "C" ][a2](a8(bn.x, bn.y, bn.X, bn.Y));
				break
			}
			return bm
		}, e = function(bm, bn) {
			if (bm[bn][n] > 7) {
				bm[bn].shift();
				var bo = bm[bn];
				while (bo[n]) {
					bm.splice(bn++, 0, [ "C" ][a2](bo.splice(0, 6)))
				}
				bm.splice(bn, 1);
				bj = h(R[n], bh && bh[n] || 0)
			}
		}, E = function(bq, bp, bn, bm, bo) {
			if (bq && bp && bq[bo][0] == "M" && bp[bo][0] != "M") {
				bp.splice(bo, 0, [ "M", bm.x, bm.y ]);
				bn.bx = 0;
				bn.by = 0;
				bn.x = bq[bo][1];
				bn.y = bq[bo][2];
				bj = h(R[n], bh && bh[n] || 0)
			}
		};
		for ( var be = 0, bj = h(R[n], bh && bh[n] || 0); be < bj; be++) {
			R[be] = bc(R[be], bi);
			e(R, be);
			bh && (bh[be] = bc(bh[be], d));
			bh && e(bh, be);
			E(R, bh, bi, d, be);
			E(bh, R, d, bi, be);
			var bd = R[be], bk = bh && bh[be], S = bd[n], bf = bh && bk[n];
			bi.x = bd[S - 2];
			bi.y = bd[S - 1];
			bi.bx = aa(bd[S - 4]) || bi.x;
			bi.by = aa(bd[S - 3]) || bi.y;
			d.bx = bh && (aa(bk[bf - 4]) || d.x);
			d.by = bh && (aa(bk[bf - 3]) || d.y);
			d.x = bh && bk[bf - 2];
			d.y = bh && bk[bf - 1]
		}
		return bh ? [ R, bh ] : R
	}, null, aD), r = an(function(bg) {
		var bf = [];
		for ( var bc = 0, bh = bg[n]; bc < bh; bc++) {
			var e = {}, be = bg[bc].match(/^([^:]*):?([\d\.]*)/);
			e.color = au.getRGB(be[1]);
			if (e.color.error) {
				return null
			}
			e.color = e.color.hex;
			be[2] && (e.offset = be[2] + "%");
			bf[f](e)
		}
		for (bc = 1, bh = bf[n] - 1; bc < bh; bc++) {
			if (!bf[bc].offset) {
				var E = aa(bf[bc - 1].offset || 0), R = 0;
				for ( var S = bc + 1; S < bh; S++) {
					if (bf[S].offset) {
						R = bf[S].offset;
						break
					}
				}
				if (!R) {
					R = 100;
					S = bh
				}
				R = aa(R);
				var bd = (R - E) / (S - bc + 1);
				for (; bc < S; bc++) {
					E += bd;
					bf[bc].offset = E + "%"
				}
			}
		}
		return bf
	}), av = function(d, R, i, E) {
		var e;
		if (au.is(d, "string") || au.is(d, "object")) {
			e = au.is(d, "string") ? P.getElementById(d) : d;
			if (e.tagName) {
				if (R == null) {
					return {
						container : e,
						width : e.style.pixelWidth || e.offsetWidth,
						height : e.style.pixelHeight || e.offsetHeight
					}
				} else {
					return {
						container : e,
						width : R,
						height : i
					}
				}
			}
		} else {
			if (au.is(d, aq) && E != null) {
				return {
					container : 1,
					x : d,
					y : R,
					width : i,
					height : E
				}
			}
		}
	}, aP = function(d, i) {
		var e = this;
		for ( var E in i) {
			if (i[W](E) && !(E in d)) {
				switch (typeof i[E]) {
				case "function":
					(function(R) {
						d[E] = d === e ? R : function() {
							return R[a7](e, arguments)
						}
					})(i[E]);
					break;
				case "object":
					d[E] = d[E] || {};
					aP.call(this, d[E], i[E]);
					break;
				default:
					d[E] = i[E];
					break
				}
			}
		}
	}, ap = function(d, e) {
		d == e.top && (e.top = d.prev);
		d == e.bottom && (e.bottom = d.next);
		d.next && (d.next.prev = d.prev);
		d.prev && (d.prev.next = d.next)
	}, ac = function(d, e) {
		if (e.top === d) {
			return
		}
		ap(d, e);
		d.next = null;
		d.prev = e.top;
		e.top.next = d;
		e.top = d
	}, l = function(d, e) {
		if (e.bottom === d) {
			return
		}
		ap(d, e);
		d.next = e.bottom;
		d.prev = null;
		e.bottom.prev = d;
		e.bottom = d
	}, D = function(e, d, i) {
		ap(e, i);
		d == i.top && (i.top = e);
		d.next && (d.next.prev = e);
		e.next = d.next;
		e.prev = d;
		d.next = e
	}, ax = function(e, d, i) {
		ap(e, i);
		d == i.bottom && (i.bottom = e);
		d.prev && (d.prev.next = e);
		e.prev = d.prev;
		d.prev = e;
		e.next = d
	}, u = function(d) {
		return function() {
			throw new Error("Rapha\xebl: you are calling to method \u201c" + d
					+ "\u201d of removed object")
		}
	}, az = /^r(?:\(([^,]+?)\s*,\s*([^\)]+?)\))?/;
	if (au.svg) {
		a4[a9].svgns = "http://www.w3.org/2000/svg";
		a4[a9].xlink = "http://www.w3.org/1999/xlink";
		U = function(d) {
			return +d + (~~d === d) * 0.5
		};
		var Z = function(S) {
			for ( var e = 0, E = S[n]; e < E; e++) {
				if (bb.call(S[e][0]) != "a") {
					for ( var d = 1, R = S[e][n]; d < R; d++) {
						S[e][d] = U(S[e][d])
					}
				} else {
					S[e][6] = U(S[e][6]);
					S[e][7] = U(S[e][7])
				}
			}
			return S
		}, aS = function(i, d) {
			if (d) {
				for ( var e in d) {
					if (d[W](e)) {
						i[y](e, d[e] + aA)
					}
				}
			} else {
				return P.createElementNS(a4[a9].svgns, i)
			}
		};
		au[aJ] = function() {
			return "Your browser supports SVG.\nYou are running Rapha\xebl "
					+ this.version
		};
		var s = function(d, E) {
			var e = aS("path");
			E.canvas && E.canvas[aU](e);
			var i = new aF(e, E);
			i.type = "path";
			ae(i, {
				fill : "none",
				stroke : "#000",
				path : d
			});
			return i
		};
		var b = function(R, bk, d) {
			var bh = "linear", be = 0.5, bc = 0.5, bm = R.style;
			bk = (bk + aA)[aZ](az,
					function(bo, i, bp) {
						bh = "radial";
						if (i && bp) {
							be = aa(i);
							bc = aa(bp);
							var bn = ((bc > 0.5) * 2 - 1);
							aV(be - 0.5, 2) + aV(bc - 0.5, 2) > 0.25
									&& (bc = af.sqrt(0.25 - aV(be - 0.5, 2))
											* bn + 0.5) && bc != 0.5
									&& (bc = bc.toFixed(5) - 0.00001 * bn)
						}
						return aA
					});
			bk = bk[C](/\s*\-\s*/);
			if (bh == "linear") {
				var bd = bk.shift();
				bd = -aa(bd);
				if (isNaN(bd)) {
					return null
				}
				var S = [ 0, 0, af.cos(bd * af.PI / 180),
						af.sin(bd * af.PI / 180) ], bj = 1 / (h(af.abs(S[2]),
						af.abs(S[3])) || 1);
				S[2] *= bj;
				S[3] *= bj;
				if (S[2] < 0) {
					S[0] = -S[2];
					S[2] = 0
				}
				if (S[3] < 0) {
					S[1] = -S[3];
					S[3] = 0
				}
			}
			var bg = r(bk);
			if (!bg) {
				return null
			}
			var e = R.getAttribute("fill");
			e = e.match(/^url\(#(.*)\)$/);
			e && d.defs.removeChild(P.getElementById(e[1]));
			var E = aS(bh + "Gradient");
			E.id = "r" + (au._id++)[aJ](36);
			aS(E, bh == "radial" ? {
				fx : be,
				fy : bc
			} : {
				x1 : S[0],
				y1 : S[1],
				x2 : S[2],
				y2 : S[3]
			});
			d.defs[aU](E);
			for ( var bf = 0, bl = bg[n]; bf < bl; bf++) {
				var bi = aS("stop");
				aS(bi, {
					offset : bg[bf].offset ? bg[bf].offset : !bf ? "0%"
							: "100%",
					"stop-color" : bg[bf].color || "#fff"
				});
				E[aU](bi)
			}
			aS(R, {
				fill : "url(#" + E.id + ")",
				opacity : 1,
				"fill-opacity" : 1
			});
			bm.fill = aA;
			bm.opacity = 1;
			bm.fillOpacity = 1;
			return 1
		};
		var Q = function(e) {
			var d = e.getBBox();
			aS(e.pattern, {
				patternTransform : au.format("translate({0},{1})", d.x, d.y)
			})
		};
		var ae = function(bi, br) {
			var bl = {
				"" : [ 0 ],
				none : [ 0 ],
				"-" : [ 3, 1 ],
				"." : [ 1, 1 ],
				"-." : [ 3, 1, 1, 1 ],
				"-.." : [ 3, 1, 1, 1, 1, 1 ],
				". " : [ 1, 3 ],
				"- " : [ 4, 3 ],
				"--" : [ 8, 3 ],
				"- ." : [ 4, 3, 1, 3 ],
				"--." : [ 8, 3, 1, 3 ],
				"--.." : [ 8, 3, 1, 3, 1, 3 ]
			}, bn = bi.node, bj = bi.attrs, bf = bi.rotate(), S = function(by,
					bx) {
				bx = bl[bb.call(bx)];
				if (bx) {
					var bv = by.attrs["stroke-width"] || "1", bt = {
						round : bv,
						square : bv,
						butt : 0
					}[by.attrs["stroke-linecap"] || br["stroke-linecap"]] || 0, bw = [];
					var bu = bx[n];
					while (bu--) {
						bw[bu] = bx[bu] * bv + ((bu % 2) ? 1 : -1) * bt
					}
					aS(bn, {
						"stroke-dasharray" : bw[aH](",")
					})
				}
			};
			br[W]("rotation") && (bf = br.rotation);
			var be = (bf + aA)[C](a);
			if (!(be.length - 1)) {
				be = null
			} else {
				be[1] = +be[1];
				be[2] = +be[2]
			}
			aa(bf) && bi.rotate(0, true);
			for ( var bm in br) {
				if (br[W](bm)) {
					if (!k[W](bm)) {
						continue
					}
					var bk = br[bm];
					bj[bm] = bk;
					switch (bm) {
					case "blur":
						bi.blur(bk);
						break;
					case "rotation":
						bi.rotate(bk, true);
						break;
					case "href":
					case "title":
					case "target":
						var bp = bn.parentNode;
						if (bb.call(bp.tagName) != "a") {
							var E = aS("a");
							bp.insertBefore(E, bn);
							E[aU](bn);
							bp = E
						}
						bp.setAttributeNS(bi.paper.xlink, bm, bk);
						break;
					case "cursor":
						bn.style.cursor = bk;
						break;
					case "clip-rect":
						var e = (bk + aA)[C](a);
						if (e[n] == 4) {
							bi.clip
									&& bi.clip.parentNode.parentNode
											.removeChild(bi.clip.parentNode);
							var i = aS("clipPath"), bo = aS("rect");
							i.id = "r" + (au._id++)[aJ](36);
							aS(bo, {
								x : e[0],
								y : e[1],
								width : e[2],
								height : e[3]
							});
							i[aU](bo);
							bi.paper.defs[aU](i);
							aS(bn, {
								"clip-path" : "url(#" + i.id + ")"
							});
							bi.clip = bo
						}
						if (!bk) {
							var bq = P.getElementById(bn
									.getAttribute("clip-path")[aZ](
									/(^url\(#|\)$)/g, aA));
							bq && bq.parentNode.removeChild(bq);
							aS(bn, {
								"clip-path" : aA
							});
							delete bi.clip
						}
						break;
					case "path":
						if (bi.type == "path") {
							aS(bn, {
								d : bk ? bj.path = Z(t(bk)) : "M0,0"
							})
						}
						break;
					case "width":
						bn[y](bm, bk);
						if (bj.fx) {
							bm = "x";
							bk = bj.x
						} else {
							break
						}
					case "x":
						if (bj.fx) {
							bk = -bj.x - (bj.width || 0)
						}
					case "rx":
						if (bm == "rx" && bi.type == "rect") {
							break
						}
					case "cx":
						be && (bm == "x" || bm == "cx")
								&& (be[1] += bk - bj[bm]);
						bn[y](bm, U(bk));
						bi.pattern && Q(bi);
						break;
					case "height":
						bn[y](bm, bk);
						if (bj.fy) {
							bm = "y";
							bk = bj.y
						} else {
							break
						}
					case "y":
						if (bj.fy) {
							bk = -bj.y - (bj.height || 0)
						}
					case "ry":
						if (bm == "ry" && bi.type == "rect") {
							break
						}
					case "cy":
						be && (bm == "y" || bm == "cy")
								&& (be[2] += bk - bj[bm]);
						bn[y](bm, U(bk));
						bi.pattern && Q(bi);
						break;
					case "r":
						if (bi.type == "rect") {
							aS(bn, {
								rx : bk,
								ry : bk
							})
						} else {
							bn[y](bm, bk)
						}
						break;
					case "src":
						if (bi.type == "image") {
							bn.setAttributeNS(bi.paper.xlink, "href", bk)
						}
						break;
					case "stroke-width":
						bn.style.strokeWidth = bk;
						bn[y](bm, bk);
						if (bj["stroke-dasharray"]) {
							S(bi, bj["stroke-dasharray"])
						}
						break;
					case "stroke-dasharray":
						S(bi, bk);
						break;
					case "translation":
						var bc = (bk + aA)[C](a);
						bc[0] = +bc[0] || 0;
						bc[1] = +bc[1] || 0;
						if (be) {
							be[1] += bc[0];
							be[2] += bc[1]
						}
						v.call(bi, bc[0], bc[1]);
						break;
					case "scale":
						bc = (bk + aA)[C](a);
						bi.scale(+bc[0] || 1, +bc[1] || +bc[0] || 1,
								isNaN(aa(bc[2])) ? null : +bc[2],
								isNaN(aa(bc[3])) ? null : +bc[3]);
						break;
					case "fill":
						var R = (bk + aA).match(c);
						if (R) {
							i = aS("pattern");
							var bh = aS("image");
							i.id = "r" + (au._id++)[aJ](36);
							aS(i, {
								x : 0,
								y : 0,
								patternUnits : "userSpaceOnUse",
								height : 1,
								width : 1
							});
							aS(bh, {
								x : 0,
								y : 0
							});
							bh.setAttributeNS(bi.paper.xlink, "href", R[1]);
							i[aU](bh);
							var bs = P.createElement("img");
							bs.style.cssText = "position:absolute;left:-9999em;top-9999em";
							bs.onload = function() {
								aS(i, {
									width : this.offsetWidth,
									height : this.offsetHeight
								});
								aS(bh, {
									width : this.offsetWidth,
									height : this.offsetHeight
								});
								P.body.removeChild(this);
								bi.paper.safari()
							};
							P.body[aU](bs);
							bs.src = R[1];
							bi.paper.defs[aU](i);
							bn.style.fill = "url(#" + i.id + ")";
							aS(bn, {
								fill : "url(#" + i.id + ")"
							});
							bi.pattern = i;
							bi.pattern && Q(bi);
							break
						}
						if (!au.getRGB(bk).error) {
							delete br.gradient;
							delete bj.gradient;
							!au.is(bj.opacity, "undefined")
									&& au.is(br.opacity, "undefined")
									&& aS(bn, {
										opacity : bj.opacity
									});
							!au.is(bj["fill-opacity"], "undefined")
									&& au.is(br["fill-opacity"], "undefined")
									&& aS(bn, {
										"fill-opacity" : bj["fill-opacity"]
									})
						} else {
							if ((({
								circle : 1,
								ellipse : 1
							})[W](bi.type) || (bk + aA).charAt() != "r")
									&& b(bn, bk, bi.paper)) {
								bj.gradient = bk;
								bj.fill = "none";
								break
							}
						}
					case "stroke":
						bn[y](bm, au.getRGB(bk).hex);
						break;
					case "gradient":
						(({
							circle : 1,
							ellipse : 1
						})[W](bi.type) || (bk + aA).charAt() != "r")
								&& b(bn, bk, bi.paper);
						break;
					case "opacity":
					case "fill-opacity":
						if (bj.gradient) {
							var d = P
									.getElementById(bn.getAttribute("fill")[aZ]
											(/^url\(#|\)$/g, aA));
							if (d) {
								var bd = d.getElementsByTagName("stop");
								bd[bd[n] - 1][y]("stop-opacity", bk)
							}
							break
						}
					default:
						bm == "font-size" && (bk = K(bk, 10) + "px");
						var bg = bm[aZ](/(\-.)/g, function(bt) {
							return aX.call(bt.substring(1))
						});
						bn.style[bg] = bk;
						bn[y](bm, bk);
						break
					}
				}
			}
			I(bi, br);
			if (be) {
				bi.rotate(be.join(at))
			} else {
				aa(bf) && bi.rotate(bf, true)
			}
		};
		var j = 1.2, I = function(d, R) {
			if (d.type != "text"
					|| !(R[W]("text") || R[W]("font") || R[W]("font-size")
							|| R[W]("x") || R[W]("y"))) {
				return
			}
			var bf = d.attrs, e = d.node, bh = e.firstChild ? K(P.defaultView
					.getComputedStyle(e.firstChild, aA).getPropertyValue(
							"font-size"), 10) : 10;
			if (R[W]("text")) {
				bf.text = R.text;
				while (e.firstChild) {
					e.removeChild(e.firstChild)
				}
				var E = (R.text + aA)[C]("\n");
				for ( var S = 0, bg = E[n]; S < bg; S++) {
					if (E[S]) {
						var bd = aS("tspan");
						S && aS(bd, {
							dy : bh * j,
							x : bf.x
						});
						bd[aU](P.createTextNode(E[S]));
						e[aU](bd)
					}
				}
			} else {
				E = e.getElementsByTagName("tspan");
				for (S = 0, bg = E[n]; S < bg; S++) {
					S && aS(E[S], {
						dy : bh * j,
						x : bf.x
					})
				}
			}
			aS(e, {
				y : bf.y
			});
			var bc = d.getBBox(), be = bf.y - (bc.y + bc.height / 2);
			be && isFinite(be) && aS(e, {
				y : bf.y + be
			})
		}, aF = function(e, d) {
			var E = 0, i = 0;
			this[0] = e;
			this.id = au._oid++;
			this.node = e;
			e.raphael = this;
			this.paper = d;
			this.attrs = this.attrs || {};
			this.transformations = [];
			this._ = {
				tx : 0,
				ty : 0,
				rt : {
					deg : 0,
					cx : 0,
					cy : 0
				},
				sx : 1,
				sy : 1
			};
			!d.bottom && (d.bottom = this);
			this.prev = d.top;
			d.top && (d.top.next = this);
			d.top = this;
			this.next = null
		};
		aF[a9].rotate = function(e, d, E) {
			if (this.removed) {
				return this
			}
			if (e == null) {
				if (this._.rt.cx) {
					return [ this._.rt.deg, this._.rt.cx, this._.rt.cy ][aH]
							(at)
				}
				return this._.rt.deg
			}
			var i = this.getBBox();
			e = (e + aA)[C](a);
			if (e[n] - 1) {
				d = aa(e[1]);
				E = aa(e[2])
			}
			e = aa(e[0]);
			if (d != null) {
				this._.rt.deg = e
			} else {
				this._.rt.deg += e
			}
			(E == null) && (d = null);
			this._.rt.cx = d;
			this._.rt.cy = E;
			d = d == null ? i.x + i.width / 2 : d;
			E = E == null ? i.y + i.height / 2 : E;
			if (this._.rt.deg) {
				this.transformations[0] = au.format("rotate({0} {1} {2})",
						this._.rt.deg, d, E);
				this.clip
						&& aS(this.clip, {
							transform : au.format("rotate({0} {1} {2})",
									-this._.rt.deg, d, E)
						})
			} else {
				this.transformations[0] = aA;
				this.clip && aS(this.clip, {
					transform : aA
				})
			}
			aS(this.node, {
				transform : this.transformations[aH](at)
			});
			return this
		};
		aF[a9].hide = function() {
			!this.removed && (this.node.style.display = "none");
			return this
		};
		aF[a9].show = function() {
			!this.removed && (this.node.style.display = "");
			return this
		};
		aF[a9].remove = function() {
			if (this.removed) {
				return
			}
			ap(this, this.paper);
			this.node.parentNode.removeChild(this.node);
			for ( var d in this) {
				delete this[d]
			}
			this.removed = true
		};
		aF[a9].getBBox = function() {
			if (this.removed) {
				return this
			}
			if (this.type == "path") {
				return Y(this.attrs.path)
			}
			if (this.node.style.display == "none") {
				this.show();
				var E = true
			}
			var bd = {};
			try {
				bd = this.node.getBBox()
			} catch (S) {
			} finally {
				bd = bd || {}
			}
			if (this.type == "text") {
				bd = {
					x : bd.x,
					y : Infinity,
					width : 0,
					height : 0
				};
				for ( var d = 0, R = this.node.getNumberOfChars(); d < R; d++) {
					var bc = this.node.getExtentOfChar(d);
					(bc.y < bd.y) && (bd.y = bc.y);
					(bc.y + bc.height - bd.y > bd.height)
							&& (bd.height = bc.y + bc.height - bd.y);
					(bc.x + bc.width - bd.x > bd.width)
							&& (bd.width = bc.x + bc.width - bd.x)
				}
			}
			E && this.hide();
			return bd
		};
		aF[a9].attr = function(E, bd) {
			if (this.removed) {
				return this
			}
			if (E == null) {
				var S = {};
				for ( var R in this.attrs) {
					if (this.attrs[W](R)) {
						S[R] = this.attrs[R]
					}
				}
				this._.rt.deg && (S.rotation = this.rotate());
				(this._.sx != 1 || this._.sy != 1) && (S.scale = this.scale());
				S.gradient && S.fill == "none" && (S.fill = S.gradient)
						&& delete S.gradient;
				return S
			}
			if (bd == null && au.is(E, "string")) {
				if (E == "translation") {
					return v.call(this)
				}
				if (E == "rotation") {
					return this.rotate()
				}
				if (E == "scale") {
					return this.scale()
				}
				if (E == "fill" && this.attrs.fill == "none"
						&& this.attrs.gradient) {
					return this.attrs.gradient
				}
				return this.attrs[E]
			}
			if (bd == null && au.is(E, "array")) {
				var d = {};
				for ( var e = 0, bc = E.length; e < bc; e++) {
					d[E[e]] = this.attr(E[e])
				}
				return d
			}
			if (bd != null) {
				var be = {};
				be[E] = bd;
				ae(this, be)
			} else {
				if (E != null && au.is(E, "object")) {
					ae(this, E)
				}
			}
			return this
		};
		aF[a9].toFront = function() {
			if (this.removed) {
				return this
			}
			this.node.parentNode[aU](this.node);
			var d = this.paper;
			d.top != this && ac(this, d);
			return this
		};
		aF[a9].toBack = function() {
			if (this.removed) {
				return this
			}
			if (this.node.parentNode.firstChild != this.node) {
				this.node.parentNode.insertBefore(this.node,
						this.node.parentNode.firstChild);
				l(this, this.paper);
				var d = this.paper
			}
			return this
		};
		aF[a9].insertAfter = function(d) {
			if (this.removed) {
				return this
			}
			var e = d.node;
			if (e.nextSibling) {
				e.parentNode.insertBefore(this.node, e.nextSibling)
			} else {
				e.parentNode[aU](this.node)
			}
			D(this, d, this.paper);
			return this
		};
		aF[a9].insertBefore = function(d) {
			if (this.removed) {
				return this
			}
			var e = d.node;
			e.parentNode.insertBefore(this.node, e);
			ax(this, d, this.paper);
			return this
		};
		aF[a9].blur = function(e) {
			var d = this;
			if (+e !== 0) {
				var i = aS("filter"), E = aS("feGaussianBlur");
				d.attrs.blur = e;
				i.id = "r" + (au._id++)[aJ](36);
				aS(E, {
					stdDeviation : +e || 1.5
				});
				i.appendChild(E);
				d.paper.defs.appendChild(i);
				d._blur = i;
				aS(d.node, {
					filter : "url(#" + i.id + ")"
				})
			} else {
				if (d._blur) {
					d._blur.parentNode.removeChild(d._blur);
					delete d._blur;
					delete d.attrs.blur
				}
				d.node.removeAttribute("filter")
			}
		};
		var V = function(e, d, S, R) {
			d = U(d);
			S = U(S);
			var E = aS("circle");
			e.canvas && e.canvas[aU](E);
			var i = new aF(E, e);
			i.attrs = {
				cx : d,
				cy : S,
				r : R,
				fill : "none",
				stroke : "#000"
			};
			i.type = "circle";
			aS(E, i.attrs);
			return i
		};
		var aO = function(i, d, bd, e, S, bc) {
			d = U(d);
			bd = U(bd);
			var R = aS("rect");
			i.canvas && i.canvas[aU](R);
			var E = new aF(R, i);
			E.attrs = {
				x : d,
				y : bd,
				width : e,
				height : S,
				r : bc || 0,
				rx : bc || 0,
				ry : bc || 0,
				fill : "none",
				stroke : "#000"
			};
			E.type = "rect";
			aS(R, E.attrs);
			return E
		};
		var am = function(e, d, bc, S, R) {
			d = U(d);
			bc = U(bc);
			var E = aS("ellipse");
			e.canvas && e.canvas[aU](E);
			var i = new aF(E, e);
			i.attrs = {
				cx : d,
				cy : bc,
				rx : S,
				ry : R,
				fill : "none",
				stroke : "#000"
			};
			i.type = "ellipse";
			aS(E, i.attrs);
			return i
		};
		var q = function(i, bc, d, bd, e, S) {
			var R = aS("image");
			aS(R, {
				x : d,
				y : bd,
				width : e,
				height : S,
				preserveAspectRatio : "none"
			});
			R.setAttributeNS(i.xlink, "href", bc);
			i.canvas && i.canvas[aU](R);
			var E = new aF(R, i);
			E.attrs = {
				x : d,
				y : bd,
				width : e,
				height : S,
				src : bc
			};
			E.type = "image";
			return E
		};
		var ab = function(e, d, S, R) {
			var E = aS("text");
			aS(E, {
				x : d,
				y : S,
				"text-anchor" : "middle"
			});
			e.canvas && e.canvas[aU](E);
			var i = new aF(E, e);
			i.attrs = {
				x : d,
				y : S,
				"text-anchor" : "middle",
				text : R,
				font : k.font,
				stroke : "none",
				fill : "#000"
			};
			i.type = "text";
			ae(i, i.attrs);
			return i
		};
		var a6 = function(e, d) {
			this.width = e || this.width;
			this.height = d || this.height;
			this.canvas[y]("width", this.width);
			this.canvas[y]("height", this.height);
			return this
		};
		var z = function() {
			var E = av[a7](0, arguments), i = E && E.container, e = E.x, bc = E.y, R = E.width, d = E.height;
			if (!i) {
				throw new Error("SVG container not found.")
			}
			var S = aS("svg");
			R = R || 512;
			d = d || 342;
			aS(S, {
				xmlns : "http://www.w3.org/2000/svg",
				version : 1.1,
				width : R,
				height : d
			});
			if (i == 1) {
				S.style.cssText = "position:absolute;left:" + e + "px;top:"
						+ bc + "px";
				P.body[aU](S)
			} else {
				if (i.firstChild) {
					i.insertBefore(S, i.firstChild)
				} else {
					i[aU](S)
				}
			}
			i = new a4;
			i.width = R;
			i.height = d;
			i.canvas = S;
			aP.call(i, i, au.fn);
			i.clear();
			return i
		};
		a4[a9].clear = function() {
			var d = this.canvas;
			while (d.firstChild) {
				d.removeChild(d.firstChild)
			}
			this.bottom = this.top = null;
			(this.desc = aS("desc"))[aU](P
					.createTextNode("Created with Rapha\xebl"));
			d[aU](this.desc);
			d[aU](this.defs = aS("defs"))
		};
		a4[a9].remove = function() {
			this.canvas.parentNode
					&& this.canvas.parentNode.removeChild(this.canvas);
			for ( var d in this) {
				this[d] = u(d)
			}
		}
	}
	if (au.vml) {
		var H = {
			M : "m",
			L : "l",
			C : "c",
			Z : "x",
			m : "t",
			l : "r",
			c : "v",
			z : "x"
		}, ay = /([clmz]),?([^clmz]*)/gi, ba = /-?[^,\s-]+/g, aI = 1000 + at + 1000, p = 10, aQ = function(
				bh) {
			var be = /[ahqstv]/ig, E = t;
			(bh + aA).match(be) && (E = L);
			be = /[clmz]/g;
			if (E == t && !(bh + aA).match(be)) {
				var bd = (bh + aA)[aZ](ay, function(bk, bm, bi) {
					var bl = [], i = bb.call(bm) == "m", bj = H[bm];
					bi[aZ](ba, function(bn) {
						if (i && bl[n] == 2) {
							bj += bl + H[bm == "m" ? "l" : "L"];
							bl = []
						}
						bl[f](U(bn * p))
					});
					return bj + bl
				});
				return bd
			}
			var bf = E(bh), e, d;
			bd = [];
			for ( var S = 0, bg = bf[n]; S < bg; S++) {
				e = bf[S];
				d = bb.call(bf[S][0]);
				d == "z" && (d = "x");
				for ( var R = 1, bc = e[n]; R < bc; R++) {
					d += U(e[R] * p) + (R != bc - 1 ? "," : aA)
				}
				bd[f](d)
			}
			return bd[aH](at)
		};
		au[aJ] = function() {
			return "Your browser doesn\u2019t support SVG. Falling down to VML.\nYou are running Rapha\xebl "
					+ this.version
		};
		s = function(i, e) {
			var S = al("group");
			S.style.cssText = "position:absolute;left:0;top:0;width:" + e.width
					+ "px;height:" + e.height + "px";
			S.coordsize = e.coordsize;
			S.coordorigin = e.coordorigin;
			var R = al("shape"), E = R.style;
			E.width = e.width + "px";
			E.height = e.height + "px";
			R.coordsize = aI;
			R.coordorigin = e.coordorigin;
			S[aU](R);
			var bc = new aF(R, S, e), d = {
				fill : "none",
				stroke : "#000"
			};
			i && (d.path = i);
			bc.isAbsolute = true;
			bc.type = "path";
			bc.path = [];
			bc.Path = aA;
			ae(bc, d);
			e.canvas[aU](S);
			return bc
		};
		ae = function(bf, bk) {
			bf.attrs = bf.attrs || {};
			var bi = bf.node, bl = bf.attrs, bc = bi.style, E, bp = bf;
			for ( var bd in bk) {
				if (bk[W](bd)) {
					bl[bd] = bk[bd]
				}
			}
			bk.href && (bi.href = bk.href);
			bk.title && (bi.title = bk.title);
			bk.target && (bi.target = bk.target);
			bk.cursor && (bc.cursor = bk.cursor);
			"blur" in bk && bf.blur(bk.blur);
			if (bk.path && bf.type == "path") {
				bl.path = bk.path;
				bi.path = aQ(bl.path)
			}
			if (bk.rotation != null) {
				bf.rotate(bk.rotation, true)
			}
			if (bk.translation) {
				E = (bk.translation + aA)[C](a);
				v.call(bf, E[0], E[1]);
				if (bf._.rt.cx != null) {
					bf._.rt.cx += +E[0];
					bf._.rt.cy += +E[1];
					bf.setBox(bf.attrs, E[0], E[1])
				}
			}
			if (bk.scale) {
				E = (bk.scale + aA)[C](a);
				bf.scale(+E[0] || 1, +E[1] || +E[0] || 1, +E[2] || null, +E[3]
						|| null)
			}
			if ("clip-rect" in bk) {
				var d = (bk["clip-rect"] + aA)[C](a);
				if (d[n] == 4) {
					d[2] = +d[2] + (+d[0]);
					d[3] = +d[3] + (+d[1]);
					var be = bi.clipRect || P.createElement("div"), bo = be.style, S = bi.parentNode;
					bo.clip = au.format("rect({1}px {2}px {3}px {0}px)", d);
					if (!bi.clipRect) {
						bo.position = "absolute";
						bo.top = 0;
						bo.left = 0;
						bo.width = bf.paper.width + "px";
						bo.height = bf.paper.height + "px";
						S.parentNode.insertBefore(be, S);
						be[aU](S);
						bi.clipRect = be
					}
				}
				if (!bk["clip-rect"]) {
					bi.clipRect && (bi.clipRect.style.clip = aA)
				}
			}
			if (bf.type == "image" && bk.src) {
				bi.src = bk.src
			}
			if (bf.type == "image" && bk.opacity) {
				bi.filterOpacity = " progid:DXImageTransform.Microsoft.Alpha(opacity="
						+ (bk.opacity * 100) + ")";
				bc.filter = (bi.filterMatrix || aA) + (bi.filterOpacity || aA)
			}
			bk.font && (bc.font = bk.font);
			bk["font-family"]
					&& (bc.fontFamily = '"'
							+ bk["font-family"][C](",")[0][aZ](
									/^['"]+|['"]+$/g, aA) + '"');
			bk["font-size"] && (bc.fontSize = bk["font-size"]);
			bk["font-weight"] && (bc.fontWeight = bk["font-weight"]);
			bk["font-style"] && (bc.fontStyle = bk["font-style"]);
			if (bk.opacity != null || bk["stroke-width"] != null
					|| bk.fill != null || bk.stroke != null
					|| bk["stroke-width"] != null
					|| bk["stroke-opacity"] != null
					|| bk["fill-opacity"] != null
					|| bk["stroke-dasharray"] != null
					|| bk["stroke-miterlimit"] != null
					|| bk["stroke-linejoin"] != null
					|| bk["stroke-linecap"] != null) {
				bi = bf.shape || bi;
				var bj = (bi.getElementsByTagName("fill") && bi
						.getElementsByTagName("fill")[0]), bm = false;
				!bj && (bm = bj = al("fill"));
				if ("fill-opacity" in bk || "opacity" in bk) {
					var e = ((+bl["fill-opacity"] + 1 || 2) - 1)
							* ((+bl.opacity + 1 || 2) - 1);
					e < 0 && (e = 0);
					e > 1 && (e = 1);
					bj.opacity = e
				}
				bk.fill && (bj.on = true);
				if (bj.on == null || bk.fill == "none") {
					bj.on = false
				}
				if (bj.on && bk.fill) {
					var i = bk.fill.match(c);
					if (i) {
						bj.src = i[1];
						bj.type = "tile"
					} else {
						bj.color = au.getRGB(bk.fill).hex;
						bj.src = aA;
						bj.type = "solid";
						if (au.getRGB(bk.fill).error && (bp.type in {
							circle : 1,
							ellipse : 1
						} || (bk.fill + aA).charAt() != "r") && b(bp, bk.fill)) {
							bl.fill = "none";
							bl.gradient = bk.fill
						}
					}
				}
				bm && bi[aU](bj);
				var R = (bi.getElementsByTagName("stroke") && bi
						.getElementsByTagName("stroke")[0]), bn = false;
				!R && (bn = R = al("stroke"));
				if ((bk.stroke && bk.stroke != "none") || bk["stroke-width"]
						|| bk["stroke-opacity"] != null
						|| bk["stroke-dasharray"] || bk["stroke-miterlimit"]
						|| bk["stroke-linejoin"] || bk["stroke-linecap"]) {
					R.on = true
				}
				(bk.stroke == "none" || R.on == null || bk.stroke == 0 || bk["stroke-width"] == 0)
						&& (R.on = false);
				R.on && bk.stroke && (R.color = au.getRGB(bk.stroke).hex);
				e = ((+bl["stroke-opacity"] + 1 || 2) - 1)
						* ((+bl.opacity + 1 || 2) - 1);
				var bg = (aa(bk["stroke-width"]) || 1) * 0.75;
				e < 0 && (e = 0);
				e > 1 && (e = 1);
				bk["stroke-width"] == null && (bg = bl["stroke-width"]);
				bk["stroke-width"] && (R.weight = bg);
				bg && bg < 1 && (e *= bg) && (R.weight = 1);
				R.opacity = e;
				bk["stroke-linejoin"]
						&& (R.joinstyle = bk["stroke-linejoin"] || "miter");
				R.miterlimit = bk["stroke-miterlimit"] || 8;
				bk["stroke-linecap"]
						&& (R.endcap = bk["stroke-linecap"] == "butt" ? "flat"
								: bk["stroke-linecap"] == "square" ? "square"
										: "round");
				if (bk["stroke-dasharray"]) {
					var bh = {
						"-" : "shortdash",
						"." : "shortdot",
						"-." : "shortdashdot",
						"-.." : "shortdashdotdot",
						". " : "dot",
						"- " : "dash",
						"--" : "longdash",
						"- ." : "dashdot",
						"--." : "longdashdot",
						"--.." : "longdashdotdot"
					};
					R.dashstyle = bh[W](bk["stroke-dasharray"]) ? bh[bk["stroke-dasharray"]]
							: aA
				}
				bn && bi[aU](R)
			}
			if (bp.type == "text") {
				bc = bp.paper.span.style;
				bl.font && (bc.font = bl.font);
				bl["font-family"] && (bc.fontFamily = bl["font-family"]);
				bl["font-size"] && (bc.fontSize = bl["font-size"]);
				bl["font-weight"] && (bc.fontWeight = bl["font-weight"]);
				bl["font-style"] && (bc.fontStyle = bl["font-style"]);
				bp.node.string
						&& (bp.paper.span.innerHTML = (bp.node.string + aA)[aZ]
								(/</g, "&#60;")[aZ](/&/g, "&#38;")[aZ](/\n/g,
								"<br>"));
				bp.W = bl.w = bp.paper.span.offsetWidth;
				bp.H = bl.h = bp.paper.span.offsetHeight;
				bp.X = bl.x;
				bp.Y = bl.y + U(bp.H / 2);
				switch (bl["text-anchor"]) {
				case "start":
					bp.node.style["v-text-align"] = "left";
					bp.bbx = U(bp.W / 2);
					break;
				case "end":
					bp.node.style["v-text-align"] = "right";
					bp.bbx = -U(bp.W / 2);
					break;
				default:
					bp.node.style["v-text-align"] = "center";
					break
				}
			}
		};
		b = function(d, bd) {
			d.attrs = d.attrs || {};
			var be = d.attrs, bg = d.node.getElementsByTagName("fill"), S = "linear", bc = ".5 .5";
			d.attrs.gradient = bd;
			bd = (bd + aA)[aZ](az, function(bi, bj, i) {
				S = "radial";
				if (bj && i) {
					bj = aa(bj);
					i = aa(i);
					aV(bj - 0.5, 2) + aV(i - 0.5, 2) > 0.25
							&& (i = af.sqrt(0.25 - aV(bj - 0.5, 2))
									* ((i > 0.5) * 2 - 1) + 0.5);
					bc = bj + at + i
				}
				return aA
			});
			bd = bd[C](/\s*\-\s*/);
			if (S == "linear") {
				var e = bd.shift();
				e = -aa(e);
				if (isNaN(e)) {
					return null
				}
			}
			var R = r(bd);
			if (!R) {
				return null
			}
			d = d.shape || d.node;
			bg = bg[0] || al("fill");
			if (R[n]) {
				bg.on = true;
				bg.method = "none";
				bg.type = (S == "radial") ? "gradientradial" : "gradient";
				bg.color = R[0].color;
				bg.color2 = R[R[n] - 1].color;
				var bh = [];
				for ( var E = 0, bf = R[n]; E < bf; E++) {
					R[E].offset && bh[f](R[E].offset + at + R[E].color)
				}
				bg.colors
						&& (bg.colors.value = bh[n] ? bh[aH](",") : "0% "
								+ bg.color);
				if (S == "radial") {
					bg.focus = "100%";
					bg.focussize = bc;
					bg.focusposition = bc
				} else {
					bg.angle = (270 - e) % 360
				}
			}
			return 1
		};
		aF = function(R, bc, d) {
			var S = 0, i = 0, e = 0, E = 1;
			this[0] = R;
			this.id = au._oid++;
			this.node = R;
			R.raphael = this;
			this.X = 0;
			this.Y = 0;
			this.attrs = {};
			this.Group = bc;
			this.paper = d;
			this._ = {
				tx : 0,
				ty : 0,
				rt : {
					deg : 0
				},
				sx : 1,
				sy : 1
			};
			!d.bottom && (d.bottom = this);
			this.prev = d.top;
			d.top && (d.top.next = this);
			d.top = this;
			this.next = null
		};
		aF[a9].rotate = function(e, d, i) {
			if (this.removed) {
				return this
			}
			if (e == null) {
				if (this._.rt.cx) {
					return [ this._.rt.deg, this._.rt.cx, this._.rt.cy ][aH]
							(at)
				}
				return this._.rt.deg
			}
			e = (e + aA)[C](a);
			if (e[n] - 1) {
				d = aa(e[1]);
				i = aa(e[2])
			}
			e = aa(e[0]);
			if (d != null) {
				this._.rt.deg = e
			} else {
				this._.rt.deg += e
			}
			i == null && (d = null);
			this._.rt.cx = d;
			this._.rt.cy = i;
			this.setBox(this.attrs, d, i);
			this.Group.style.rotation = this._.rt.deg;
			return this
		};
		aF[a9].setBox = function(bo, e, d) {
			if (this.removed) {
				return this
			}
			var bi = this.Group.style, R = (this.shape && this.shape.style)
					|| this.node.style;
			bo = bo || {};
			for ( var bm in bo) {
				if (bo[W](bm)) {
					this.attrs[bm] = bo[bm]
				}
			}
			e = e || this._.rt.cx;
			d = d || this._.rt.cy;
			var bk = this.attrs, bd, bc, be, bn;
			switch (this.type) {
			case "circle":
				bd = bk.cx - bk.r;
				bc = bk.cy - bk.r;
				be = bn = bk.r * 2;
				break;
			case "ellipse":
				bd = bk.cx - bk.rx;
				bc = bk.cy - bk.ry;
				be = bk.rx * 2;
				bn = bk.ry * 2;
				break;
			case "rect":
			case "image":
				bd = +bk.x;
				bc = +bk.y;
				be = bk.width || 0;
				bn = bk.height || 0;
				break;
			case "text":
				this.textpath.v = [ "m", U(bk.x), ", ", U(bk.y - 2), "l",
						U(bk.x) + 1, ", ", U(bk.y - 2) ][aH](aA);
				bd = bk.x - U(this.W / 2);
				bc = bk.y - this.H / 2;
				be = this.W;
				bn = this.H;
				break;
			case "path":
				if (!this.attrs.path) {
					bd = 0;
					bc = 0;
					be = this.paper.width;
					bn = this.paper.height
				} else {
					var bl = Y(this.attrs.path);
					bd = bl.x;
					bc = bl.y;
					be = bl.width;
					bn = bl.height
				}
				break;
			default:
				bd = 0;
				bc = 0;
				be = this.paper.width;
				bn = this.paper.height;
				break
			}
			e = (e == null) ? bd + be / 2 : e;
			d = (d == null) ? bc + bn / 2 : d;
			var E = e - this.paper.width / 2, bh = d - this.paper.height / 2, bg;
			bi.left != (bg = E + "px") && (bi.left = bg);
			bi.top != (bg = bh + "px") && (bi.top = bg);
			this.X = this.type == "path" ? -E : bd;
			this.Y = this.type == "path" ? -bh : bc;
			this.W = be;
			this.H = bn;
			if (this.type == "path") {
				R.left != (bg = -E * p + "px") && (R.left = bg);
				R.top != (bg = -bh * p + "px") && (R.top = bg)
			} else {
				if (this.type == "text") {
					R.left != (bg = -E + "px") && (R.left = bg);
					R.top != (bg = -bh + "px") && (R.top = bg)
				} else {
					bi.width != (bg = this.paper.width + "px")
							&& (bi.width = bg);
					bi.height != (bg = this.paper.height + "px")
							&& (bi.height = bg);
					R.left != (bg = bd - E + "px") && (R.left = bg);
					R.top != (bg = bc - bh + "px") && (R.top = bg);
					R.width != (bg = be + "px") && (R.width = bg);
					R.height != (bg = bn + "px") && (R.height = bg);
					var S = (+bo.r || 0) / aR(be, bn);
					if (this.type == "rect"
							&& this.arcsize.toFixed(4) != S.toFixed(4)
							&& (S || this.arcsize)) {
						var bj = al("roundrect"), bp = {}, bf = this.events
								&& this.events[n];
						bm = 0;
						bj.arcsize = S;
						bj.raphael = this;
						this.Group[aU](bj);
						this.Group.removeChild(this.node);
						this[0] = this.node = bj;
						this.arcsize = S;
						for (bm in bk) {
							bp[bm] = bk[bm]
						}
						delete bp.scale;
						this.attr(bp);
						if (this.events) {
							for (; bm < bf; bm++) {
								this.events[bm].unbind = ai(this.node,
										this.events[bm].name,
										this.events[bm].f, this)
							}
						}
					}
				}
			}
		};
		aF[a9].hide = function() {
			!this.removed && (this.Group.style.display = "none");
			return this
		};
		aF[a9].show = function() {
			!this.removed && (this.Group.style.display = "block");
			return this
		};
		aF[a9].getBBox = function() {
			if (this.removed) {
				return this
			}
			if (this.type == "path") {
				return Y(this.attrs.path)
			}
			return {
				x : this.X + (this.bbx || 0),
				y : this.Y,
				width : this.W,
				height : this.H
			}
		};
		aF[a9].remove = function() {
			if (this.removed) {
				return
			}
			ap(this, this.paper);
			this.node.parentNode.removeChild(this.node);
			this.Group.parentNode.removeChild(this.Group);
			this.shape && this.shape.parentNode.removeChild(this.shape);
			for ( var d in this) {
				delete this[d]
			}
			this.removed = true
		};
		aF[a9].attr = function(e, bc) {
			if (this.removed) {
				return this
			}
			if (e == null) {
				var R = {};
				for ( var E in this.attrs) {
					if (this.attrs[W](E)) {
						R[E] = this.attrs[E]
					}
				}
				this._.rt.deg && (R.rotation = this.rotate());
				(this._.sx != 1 || this._.sy != 1) && (R.scale = this.scale());
				R.gradient && R.fill == "none" && (R.fill = R.gradient)
						&& delete R.gradient;
				return R
			}
			if (bc == null && au.is(e, "string")) {
				if (e == "translation") {
					return v.call(this)
				}
				if (e == "rotation") {
					return this.rotate()
				}
				if (e == "scale") {
					return this.scale()
				}
				if (e == "fill" && this.attrs.fill == "none"
						&& this.attrs.gradient) {
					return this.attrs.gradient
				}
				return this.attrs[e]
			}
			if (this.attrs && bc == null && au.is(e, "array")) {
				var S, d = {};
				for (E = 0, S = e[n]; E < S; E++) {
					d[e[E]] = this.attr(e[E])
				}
				return d
			}
			var bd;
			if (bc != null) {
				bd = {};
				bd[e] = bc
			}
			bc == null && au.is(e, "object") && (bd = e);
			if (bd) {
				if (bd.text && this.type == "text") {
					this.node.string = bd.text
				}
				ae(this, bd);
				if (bd.gradient && (({
					circle : 1,
					ellipse : 1
				})[W](this.type) || (bd.gradient + aA).charAt() != "r")) {
					b(this, bd.gradient)
				}
				(this.type != "path" || this._.rt.deg)
						&& this.setBox(this.attrs)
			}
			return this
		};
		aF[a9].toFront = function() {
			!this.removed && this.Group.parentNode[aU](this.Group);
			this.paper.top != this && ac(this, this.paper);
			return this
		};
		aF[a9].toBack = function() {
			if (this.removed) {
				return this
			}
			if (this.Group.parentNode.firstChild != this.Group) {
				this.Group.parentNode.insertBefore(this.Group,
						this.Group.parentNode.firstChild);
				l(this, this.paper)
			}
			return this
		};
		aF[a9].insertAfter = function(d) {
			if (this.removed) {
				return this
			}
			if (d.Group.nextSibling) {
				d.Group.parentNode
						.insertBefore(this.Group, d.Group.nextSibling)
			} else {
				d.Group.parentNode[aU](this.Group)
			}
			D(this, d, this.paper);
			return this
		};
		aF[a9].insertBefore = function(d) {
			if (this.removed) {
				return this
			}
			d.Group.parentNode.insertBefore(this.Group, d.Group);
			ax(this, d, this.paper);
			return this
		};
		var a3 = / progid:\S+Blur\([^\)]+\)/g;
		aF[a9].blur = function(d) {
			var e = this.node.style, i = e.filter;
			i = i.replace(a3, "");
			if (+d !== 0) {
				this.attrs.blur = d;
				e.filter = i
						+ " progid:DXImageTransform.Microsoft.Blur(pixelradius="
						+ (+d || 1.5) + ")";
				e.margin = Raphael.format("-{0}px 0 0 -{0}px", Math
						.round(+d || 1.5))
			} else {
				e.filter = i;
				e.margin = 0;
				delete this.attrs.blur
			}
		};
		V = function(e, d, bd, S) {
			var R = al("group"), bc = al("oval"), i = bc.style;
			R.style.cssText = "position:absolute;left:0;top:0;width:" + e.width
					+ "px;height:" + e.height + "px";
			R.coordsize = aI;
			R.coordorigin = e.coordorigin;
			R[aU](bc);
			var E = new aF(bc, R, e);
			E.type = "circle";
			ae(E, {
				stroke : "#000",
				fill : "none"
			});
			E.attrs.cx = d;
			E.attrs.cy = bd;
			E.attrs.r = S;
			E.setBox({
				x : d - S,
				y : bd - S,
				width : S * 2,
				height : S * 2
			});
			e.canvas[aU](R);
			return E
		};
		aO = function(e, bd, bc, be, E, d) {
			var R = al("group"), i = al("roundrect"), bf = (+d || 0)
					/ (aR(be, E));
			R.style.cssText = "position:absolute;left:0;top:0;width:" + e.width
					+ "px;height:" + e.height + "px";
			R.coordsize = aI;
			R.coordorigin = e.coordorigin;
			R[aU](i);
			i.arcsize = bf;
			var S = new aF(i, R, e);
			S.type = "rect";
			ae(S, {
				stroke : "#000"
			});
			S.arcsize = bf;
			S.setBox({
				x : bd,
				y : bc,
				width : be,
				height : E,
				r : d
			});
			e.canvas[aU](R);
			return S
		};
		am = function(d, be, bd, i, e) {
			var R = al("group"), E = al("oval"), bc = E.style;
			R.style.cssText = "position:absolute;left:0;top:0;width:" + d.width
					+ "px;height:" + d.height + "px";
			R.coordsize = aI;
			R.coordorigin = d.coordorigin;
			R[aU](E);
			var S = new aF(E, R, d);
			S.type = "ellipse";
			ae(S, {
				stroke : "#000"
			});
			S.attrs.cx = be;
			S.attrs.cy = bd;
			S.attrs.rx = i;
			S.attrs.ry = e;
			S.setBox({
				x : be - i,
				y : bd - e,
				width : i * 2,
				height : e * 2
			});
			d.canvas[aU](R);
			return S
		};
		q = function(e, d, be, bd, bf, E) {
			var R = al("group"), i = al("image"), bc = i.style;
			R.style.cssText = "position:absolute;left:0;top:0;width:" + e.width
					+ "px;height:" + e.height + "px";
			R.coordsize = aI;
			R.coordorigin = e.coordorigin;
			i.src = d;
			R[aU](i);
			var S = new aF(i, R, e);
			S.type = "image";
			S.attrs.src = d;
			S.attrs.x = be;
			S.attrs.y = bd;
			S.attrs.w = bf;
			S.attrs.h = E;
			S.setBox({
				x : be,
				y : bd,
				width : bf,
				height : E
			});
			e.canvas[aU](R);
			return S
		};
		ab = function(e, be, bd, bf) {
			var R = al("group"), E = al("shape"), bc = E.style, bg = al("path"), d = bg.style, i = al("textpath");
			R.style.cssText = "position:absolute;left:0;top:0;width:" + e.width
					+ "px;height:" + e.height + "px";
			R.coordsize = aI;
			R.coordorigin = e.coordorigin;
			bg.v = au.format("m{0},{1}l{2},{1}", U(be * 10), U(bd * 10),
					U(be * 10) + 1);
			bg.textpathok = true;
			bc.width = e.width;
			bc.height = e.height;
			i.string = bf + aA;
			i.on = true;
			E[aU](i);
			E[aU](bg);
			R[aU](E);
			var S = new aF(i, R, e);
			S.shape = E;
			S.textpath = bg;
			S.type = "text";
			S.attrs.text = bf;
			S.attrs.x = be;
			S.attrs.y = bd;
			S.attrs.w = 1;
			S.attrs.h = 1;
			ae(S, {
				font : k.font,
				stroke : "none",
				fill : "#000"
			});
			S.setBox();
			e.canvas[aU](R);
			return S
		};
		a6 = function(i, d) {
			var e = this.canvas.style;
			i == +i && (i += "px");
			d == +d && (d += "px");
			e.width = i;
			e.height = d;
			e.clip = "rect(0 " + i + " " + d + " 0)";
			return this
		};
		var al;
		P.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)");
		try {
			!P.namespaces.rvml
					&& P.namespaces
							.add("rvml", "urn:schemas-microsoft-com:vml");
			al = function(d) {
				return P.createElement("<rvml:" + d + ' class="rvml">')
			}
		} catch (aj) {
			al = function(d) {
				return P
						.createElement("<"
								+ d
								+ ' xmlns="urn:schemas-microsoft.com:vml" class="rvml">')
			}
		}
		z = function() {
			var i = av[a7](0, arguments), d = i.container, be = i.height, bf, e = i.width, bd = i.x, bc = i.y;
			if (!d) {
				throw new Error("VML container not found.")
			}
			var R = new a4, S = R.canvas = P.createElement("div"), E = S.style;
			e = e || 512;
			be = be || 342;
			e == +e && (e += "px");
			be == +be && (be += "px");
			R.width = 1000;
			R.height = 1000;
			R.coordsize = p * 1000 + at + p * 1000;
			R.coordorigin = "0 0";
			R.span = P.createElement("span");
			R.span.style.cssText = "position:absolute;left:-9999em;top:-9999em;padding:0;margin:0;line-height:1;display:inline;";
			S[aU](R.span);
			E.cssText = au
					.format(
							"width:{0};height:{1};position:absolute;clip:rect(0 {0} {1} 0);overflow:hidden",
							e, be);
			if (d == 1) {
				P.body[aU](S);
				E.left = bd + "px";
				E.top = bc + "px"
			} else {
				d.style.width = e;
				d.style.height = be;
				if (d.firstChild) {
					d.insertBefore(S, d.firstChild)
				} else {
					d[aU](S)
				}
			}
			aP.call(R, R, au.fn);
			return R
		};
		a4[a9].clear = function() {
			this.canvas.innerHTML = aA;
			this.span = P.createElement("span");
			this.span.style.cssText = "position:absolute;left:-9999em;top:-9999em;padding:0;margin:0;line-height:1;display:inline;";
			this.canvas[aU](this.span);
			this.bottom = this.top = null
		};
		a4[a9].remove = function() {
			this.canvas.parentNode.removeChild(this.canvas);
			for ( var d in this) {
				this[d] = u(d)
			}
			return true
		}
	}
	if ((/^Apple|^Google/).test(aB.navigator.vendor)
			&& !(aB.navigator.userAgent.indexOf("Version/4.0") + 1)) {
		a4[a9].safari = function() {
			var d = this.rect(-99, -99, this.width + 99, this.height + 99);
			aB.setTimeout(function() {
				d.remove()
			})
		}
	} else {
		a4[a9].safari = function() {
		}
	}
	var ai = (function() {
		if (P.addEventListener) {
			return function(R, i, e, d) {
				var E = function(S) {
					return e.call(d, S)
				};
				R.addEventListener(i, E, false);
				return function() {
					R.removeEventListener(i, E, false);
					return true
				}
			}
		} else {
			if (P.attachEvent) {
				return function(S, E, i, e) {
					var R = function(bc) {
						return i.call(e, bc || aB.event)
					};
					S.attachEvent("on" + E, R);
					var d = function() {
						S.detachEvent("on" + E, R);
						return true
					};
					return d
				}
			}
		}
	})();
	for ( var ag = J[n]; ag--;) {
		(function(d) {
			aF[a9][d] = function(e) {
				if (au.is(e, "function")) {
					this.events = this.events || [];
					this.events.push({
						name : d,
						f : e,
						unbind : ai(this.shape || this.node, d, e, this)
					})
				}
				return this
			};
			aF[a9]["un" + d] = function(E) {
				var i = this.events, e = i[n];
				while (e--) {
					if (i[e].name == d && i[e].f == E) {
						i[e].unbind();
						i.splice(e, 1);
						!i.length && delete this.events;
						return this
					}
				}
				return this
			}
		})(J[ag])
	}
	aF[a9].hover = function(e, d) {
		return this.mouseover(e).mouseout(d)
	};
	aF[a9].unhover = function(e, d) {
		return this.unmouseover(e).unmouseout(d)
	};
	a4[a9].circle = function(d, i, e) {
		return V(this, d || 0, i || 0, e || 0)
	};
	a4[a9].rect = function(d, R, e, i, E) {
		return aO(this, d || 0, R || 0, e || 0, i || 0, E || 0)
	};
	a4[a9].ellipse = function(d, E, i, e) {
		return am(this, d || 0, E || 0, i || 0, e || 0)
	};
	a4[a9].path = function(d) {
		d && !au.is(d, "string") && !au.is(d[0], "array") && (d += aA);
		return s(au.format[a7](au, arguments), this)
	};
	a4[a9].image = function(E, d, R, e, i) {
		return q(this, E || "about:blank", d || 0, R || 0, e || 0, i || 0)
	};
	a4[a9].text = function(d, i, e) {
		return ab(this, d || 0, i || 0, e || aA)
	};
	a4[a9].set = function(d) {
		arguments[n] > 1
				&& (d = Array[a9].splice.call(arguments, 0, arguments[n]));
		return new X(d)
	};
	a4[a9].setSize = a6;
	a4[a9].top = a4[a9].bottom = null;
	a4[a9].raphael = au;
	function x() {
		return this.x + at + this.y
	}
	aF[a9].scale = function(bi, bh, E, e) {
		if (bi == null && bh == null) {
			return {
				x : this._.sx,
				y : this._.sy,
				toString : x
			}
		}
		bh = bh || bi;
		!+bh && (bh = bi);
		var bm, bk, bl, bj, by = this.attrs;
		if (bi != 0) {
			var bg = this.getBBox(), bd = bg.x + bg.width / 2, R = bg.y
					+ bg.height / 2, bx = bi / this._.sx, bw = bh / this._.sy;
			E = (+E || E == 0) ? E : bd;
			e = (+e || e == 0) ? e : R;
			var bf = ~~(bi / af.abs(bi)), bc = ~~(bh / af.abs(bh)), bp = this.node.style, bA = E
					+ (bd - E) * bx, bz = e + (R - e) * bw;
			switch (this.type) {
			case "rect":
			case "image":
				var be = by.width * bf * bx, bo = by.height * bc * bw;
				this.attr({
					height : bo,
					r : by.r * aR(bf * bx, bc * bw),
					width : be,
					x : bA - be / 2,
					y : bz - bo / 2
				});
				break;
			case "circle":
			case "ellipse":
				this.attr({
					rx : by.rx * bf * bx,
					ry : by.ry * bc * bw,
					r : by.r * aR(bf * bx, bc * bw),
					cx : bA,
					cy : bz
				});
				break;
			case "path":
				var br = ah(by.path), bs = true;
				for ( var bu = 0, bn = br[n]; bu < bn; bu++) {
					var bq = br[bu], S = aX.call(bq[0]);
					if (S == "M" && bs) {
						continue
					} else {
						bs = false
					}
					if (S == "A") {
						bq[br[bu][n] - 2] *= bx;
						bq[br[bu][n] - 1] *= bw;
						bq[1] *= bf * bx;
						bq[2] *= bc * bw;
						bq[5] = +!(bf + bc ? !+bq[5] : +bq[5])
					} else {
						if (S == "H") {
							for ( var bt = 1, bv = bq[n]; bt < bv; bt++) {
								bq[bt] *= bx
							}
						} else {
							if (S == "V") {
								for (bt = 1, bv = bq[n]; bt < bv; bt++) {
									bq[bt] *= bw
								}
							} else {
								for (bt = 1, bv = bq[n]; bt < bv; bt++) {
									bq[bt] *= (bt % 2) ? bx : bw
								}
							}
						}
					}
				}
				var d = Y(br);
				bm = bA - d.x - d.width / 2;
				bk = bz - d.y - d.height / 2;
				br[0][1] += bm;
				br[0][2] += bk;
				this.attr({
					path : br
				});
				break
			}
			if (this.type in {
				text : 1,
				image : 1
			} && (bf != 1 || bc != 1)) {
				if (this.transformations) {
					this.transformations[2] = "scale("[a2](bf, ",", bc, ")");
					this.node[y]("transform", this.transformations[aH](at));
					bm = (bf == -1) ? -by.x - (be || 0) : by.x;
					bk = (bc == -1) ? -by.y - (bo || 0) : by.y;
					this.attr({
						x : bm,
						y : bk
					});
					by.fx = bf - 1;
					by.fy = bc - 1
				} else {
					this.node.filterMatrix = " progid:DXImageTransform.Microsoft.Matrix(M11="[a2]
							(bf, ", M12=0, M21=0, M22=", bc,
									", Dx=0, Dy=0, sizingmethod='auto expand', filtertype='bilinear')");
					bp.filter = (this.node.filterMatrix || aA)
							+ (this.node.filterOpacity || aA)
				}
			} else {
				if (this.transformations) {
					this.transformations[2] = aA;
					this.node[y]("transform", this.transformations[aH](at));
					by.fx = 0;
					by.fy = 0
				} else {
					this.node.filterMatrix = aA;
					bp.filter = (this.node.filterMatrix || aA)
							+ (this.node.filterOpacity || aA)
				}
			}
			by.scale = [ bi, bh, E, e ][aH](at);
			this._.sx = bi;
			this._.sy = bh
		}
		return this
	};
	aF[a9].clone = function() {
		var d = this.attr();
		delete d.scale;
		delete d.translation;
		return this.paper[this.type]().attr(d)
	};
	var g = an(function(E, d, bd, bc, bj, bi, bh, bg, R) {
		var bf = 0, S;
		for ( var be = 0; be < 1.001; be += 0.001) {
			var e = au.findDotsAtSegment(E, d, bd, bc, bj, bi, bh, bg, be);
			be && (bf += aV(aV(S.x - e.x, 2) + aV(S.y - e.y, 2), 0.5));
			if (bf >= R) {
				return e
			}
			S = e
		}
	}), aK = function(d, e) {
		return function(bl, S, bc) {
			bl = L(bl);
			var bh, bg, E, bd, R = "", bk = {}, bi, bf = 0;
			for ( var be = 0, bj = bl.length; be < bj; be++) {
				E = bl[be];
				if (E[0] == "M") {
					bh = +E[1];
					bg = +E[2]
				} else {
					bd = o(bh, bg, E[1], E[2], E[3], E[4], E[5], E[6]);
					if (bf + bd > S) {
						if (e && !bk.start) {
							bi = g(bh, bg, E[1], E[2], E[3], E[4], E[5], E[6],
									S - bf);
							R += [ "C", bi.start.x, bi.start.y, bi.m.x, bi.m.y,
									bi.x, bi.y ];
							if (bc) {
								return R
							}
							bk.start = R;
							R = [ "M", bi.x, bi.y + "C", bi.n.x, bi.n.y,
									bi.end.x, bi.end.y, E[5], E[6] ][aH]();
							bf += bd;
							bh = +E[5];
							bg = +E[6];
							continue
						}
						if (!d && !e) {
							bi = g(bh, bg, E[1], E[2], E[3], E[4], E[5], E[6],
									S - bf);
							return {
								x : bi.x,
								y : bi.y,
								alpha : bi.alpha
							}
						}
					}
					bf += bd;
					bh = +E[5];
					bg = +E[6]
				}
				R += E
			}
			bk.end = R;
			bi = d ? bf : e ? bk : au.findDotsAtSegment(bh, bg, E[1], E[2],
					E[3], E[4], E[5], E[6], 1);
			bi.alpha && (bi = {
				x : bi.x,
				y : bi.y,
				alpha : bi.alpha
			});
			return bi
		}
	}, o = an(function(E, d, bc, S, bi, bh, bg, bf) {
		var R = {
			x : 0,
			y : 0
		}, be = 0;
		for ( var bd = 0; bd < 1.01; bd += 0.01) {
			var e = T(E, d, bc, S, bi, bh, bg, bf, bd);
			bd && (be += aV(aV(R.x - e.x, 2) + aV(R.y - e.y, 2), 0.5));
			R = e
		}
		return be
	});
	var aw = aK(1), G = aK(), N = aK(0, 1);
	aF[a9].getTotalLength = function() {
		if (this.type != "path") {
			return
		}
		return aw(this.attrs.path)
	};
	aF[a9].getPointAtLength = function(d) {
		if (this.type != "path") {
			return
		}
		return G(this.attrs.path, d)
	};
	aF[a9].getSubpath = function(i, e) {
		if (this.type != "path") {
			return
		}
		if (af.abs(this.getTotalLength() - e) < 0.000001) {
			return N(this.attrs.path, i).end
		}
		var d = N(this.attrs.path, e, 1);
		return i ? N(d, i).end : d
	};
	au.easing_formulas = {
		linear : function(d) {
			return d
		},
		"<" : function(d) {
			return aV(d, 3)
		},
		">" : function(d) {
			return aV(d - 1, 3) + 1
		},
		"<>" : function(d) {
			d = d * 2;
			if (d < 1) {
				return aV(d, 3) / 2
			}
			d -= 2;
			return (aV(d, 3) + 2) / 2
		},
		backIn : function(e) {
			var d = 1.70158;
			return e * e * ((d + 1) * e - d)
		},
		backOut : function(e) {
			e = e - 1;
			var d = 1.70158;
			return e * e * ((d + 1) * e + d) + 1
		},
		elastic : function(i) {
			if (i == 0 || i == 1) {
				return i
			}
			var e = 0.3, d = e / 4;
			return aV(2, -10 * i) * af.sin((i - d) * (2 * af.PI) / e) + 1
		},
		bounce : function(E) {
			var e = 7.5625, i = 2.75, d;
			if (E < (1 / i)) {
				d = e * E * E
			} else {
				if (E < (2 / i)) {
					E -= (1.5 / i);
					d = e * E * E + 0.75
				} else {
					if (E < (2.5 / i)) {
						E -= (2.25 / i);
						d = e * E * E + 0.9375
					} else {
						E -= (2.625 / i);
						d = e * E * E + 0.984375
					}
				}
			}
			return d
		}
	};
	var M = {
		length : 0
	}, a1 = function() {
		var be = +new Date;
		for ( var bq in M) {
			if (bq != "length" && M[W](bq)) {
				var bv = M[bq];
				if (bv.stop || bv.el.removed) {
					delete M[bq];
					M[n]--;
					continue
				}
				var bc = be - bv.start, bn = bv.ms, bm = bv.easing, br = bv.from, bj = bv.diff, E = bv.to, bi = bv.t, bl = bv.prev || 0, bd = bv.el, R = bv.callback, bk = {}, d;
				if (bc < bn) {
					var S = au.easing_formulas[bm] ? au.easing_formulas[bm](bc
							/ bn) : bc / bn;
					for ( var bo in br) {
						if (br[W](bo)) {
							switch (ad[bo]) {
							case "along":
								d = S * bn * bj[bo];
								E.back && (d = E.len - d);
								var bp = G(E[bo], d);
								bd.translate(bj.sx - bj.x || 0, bj.sy - bj.y
										|| 0);
								bj.x = bp.x;
								bj.y = bp.y;
								bd.translate(bp.x - bj.sx, bp.y - bj.sy);
								E.rot && bd.rotate(bj.r + bp.alpha, bp.x, bp.y);
								break;
							case "number":
								d = +br[bo] + S * bn * bj[bo];
								break;
							case "colour":
								d = "rgb("
										+ [
												F(U(br[bo].r + S * bn
														* bj[bo].r)),
												F(U(br[bo].g + S * bn
														* bj[bo].g)),
												F(U(br[bo].b + S * bn
														* bj[bo].b)) ][aH](",")
										+ ")";
								break;
							case "path":
								d = [];
								for ( var bt = 0, bh = br[bo][n]; bt < bh; bt++) {
									d[bt] = [ br[bo][bt][0] ];
									for ( var bs = 1, bu = br[bo][bt][n]; bs < bu; bs++) {
										d[bt][bs] = +br[bo][bt][bs] + S * bn
												* bj[bo][bt][bs]
									}
									d[bt] = d[bt][aH](at)
								}
								d = d[aH](at);
								break;
							case "csv":
								switch (bo) {
								case "translation":
									var bg = bj[bo][0] * (bc - bl), bf = bj[bo][1]
											* (bc - bl);
									bi.x += bg;
									bi.y += bf;
									d = bg + at + bf;
									break;
								case "rotation":
									d = +br[bo][0] + S * bn * bj[bo][0];
									br[bo][1]
											&& (d += "," + br[bo][1] + ","
													+ br[bo][2]);
									break;
								case "scale":
									d = [ +br[bo][0] + S * bn * bj[bo][0],
											+br[bo][1] + S * bn * bj[bo][1],
											(2 in E[bo] ? E[bo][2] : aA),
											(3 in E[bo] ? E[bo][3] : aA) ][aH]
											(at);
									break;
								case "clip-rect":
									d = [];
									bt = 4;
									while (bt--) {
										d[bt] = +br[bo][bt] + S * bn
												* bj[bo][bt]
									}
									break
								}
								break
							}
							bk[bo] = d
						}
					}
					bd.attr(bk);
					bd._run && bd._run.call(bd)
				} else {
					if (E.along) {
						bp = G(E.along, E.len * !E.back);
						bd.translate(bj.sx - (bj.x || 0) + bp.x - bj.sx, bj.sy
								- (bj.y || 0) + bp.y - bj.sy);
						E.rot && bd.rotate(bj.r + bp.alpha, bp.x, bp.y)
					}
					(bi.x || bi.y) && bd.translate(-bi.x, -bi.y);
					E.scale && (E.scale = E.scale + aA);
					bd.attr(E);
					delete M[bq];
					M[n]--;
					bd.in_animation = null;
					au.is(R, "function") && R.call(bd)
				}
				bv.prev = bc
			}
		}
		au.svg && bd && bd.paper.safari();
		M[n] && aB.setTimeout(a1)
	}, F = function(d) {
		return d > 255 ? 255 : (d < 0 ? 0 : d)
	}, v = function(d, i) {
		if (d == null) {
			return {
				x : this._.tx,
				y : this._.ty,
				toString : x
			}
		}
		this._.tx += +d;
		this._.ty += +i;
		switch (this.type) {
		case "circle":
		case "ellipse":
			this.attr({
				cx : +d + this.attrs.cx,
				cy : +i + this.attrs.cy
			});
			break;
		case "rect":
		case "image":
		case "text":
			this.attr({
				x : +d + this.attrs.x,
				y : +i + this.attrs.y
			});
			break;
		case "path":
			var e = ah(this.attrs.path);
			e[0][1] += +d;
			e[0][2] += +i;
			this.attr({
				path : e
			});
			break
		}
		return this
	};
	aF[a9].animateWith = function(e, i, d, R, E) {
		M[e.id] && (i.start = M[e.id].start);
		return this.animate(i, d, R, E)
	};
	aF[a9].animateAlong = aG();
	aF[a9].animateAlongBack = aG(1);
	function aG(d) {
		return function(E, i, e, S) {
			var R = {
				back : d
			};
			au.is(e, "function") ? (S = e) : (R.rot = e);
			E && E.constructor == aF && (E = E.attrs.path);
			E && (R.along = E);
			return this.animate(R, i, S)
		}
	}
	aF[a9].onAnimation = function(d) {
		this._run = d || 0;
		return this
	};
	aF[a9].animate = function(bq, bh, bg, E) {
		if (au.is(bg, "function") || !bg) {
			E = bg || null
		}
		var bl = {}, e = {}, be = {};
		for ( var bi in bq) {
			if (bq[W](bi)) {
				if (ad[W](bi)) {
					bl[bi] = this.attr(bi);
					(bl[bi] == null) && (bl[bi] = k[bi]);
					e[bi] = bq[bi];
					switch (ad[bi]) {
					case "along":
						var bo = aw(bq[bi]), bj = G(bq[bi], bo * !!bq.back), R = this
								.getBBox();
						be[bi] = bo / bh;
						be.tx = R.x;
						be.ty = R.y;
						be.sx = bj.x;
						be.sy = bj.y;
						e.rot = bq.rot;
						e.back = bq.back;
						e.len = bo;
						bq.rot && (be.r = aa(this.rotate()) || 0);
						break;
					case "number":
						be[bi] = (e[bi] - bl[bi]) / bh;
						break;
					case "colour":
						bl[bi] = au.getRGB(bl[bi]);
						var bk = au.getRGB(e[bi]);
						be[bi] = {
							r : (bk.r - bl[bi].r) / bh,
							g : (bk.g - bl[bi].g) / bh,
							b : (bk.b - bl[bi].b) / bh
						};
						break;
					case "path":
						var S = L(bl[bi], e[bi]);
						bl[bi] = S[0];
						var bf = S[1];
						be[bi] = [];
						for ( var bn = 0, bd = bl[bi][n]; bn < bd; bn++) {
							be[bi][bn] = [ 0 ];
							for ( var bm = 1, bp = bl[bi][bn][n]; bm < bp; bm++) {
								be[bi][bn][bm] = (bf[bn][bm] - bl[bi][bn][bm])
										/ bh
							}
						}
						break;
					case "csv":
						var d = (bq[bi] + aA)[C](a), bc = (bl[bi] + aA)[C](a);
						switch (bi) {
						case "translation":
							bl[bi] = [ 0, 0 ];
							be[bi] = [ d[0] / bh, d[1] / bh ];
							break;
						case "rotation":
							bl[bi] = (bc[1] == d[1] && bc[2] == d[2]) ? bc : [
									0, d[1], d[2] ];
							be[bi] = [ (d[0] - bl[bi][0]) / bh, 0, 0 ];
							break;
						case "scale":
							bq[bi] = d;
							bl[bi] = (bl[bi] + aA)[C](a);
							be[bi] = [ (d[0] - bl[bi][0]) / bh,
									(d[1] - bl[bi][1]) / bh, 0, 0 ];
							break;
						case "clip-rect":
							bl[bi] = (bl[bi] + aA)[C](a);
							be[bi] = [];
							bn = 4;
							while (bn--) {
								be[bi][bn] = (d[bn] - bl[bi][bn]) / bh
							}
							break
						}
						e[bi] = d
					}
				}
			}
		}
		this.stop();
		this.in_animation = 1;
		M[this.id] = {
			start : bq.start || +new Date,
			ms : bh,
			easing : bg,
			from : bl,
			diff : be,
			to : e,
			el : this,
			callback : E,
			t : {
				x : 0,
				y : 0
			}
		};
		++M[n] == 1 && a1();
		return this
	};
	aF[a9].stop = function() {
		M[this.id] && M[n]--;
		delete M[this.id];
		return this
	};
	aF[a9].translate = function(d, e) {
		return this.attr({
			translation : d + " " + e
		})
	};
	aF[a9][aJ] = function() {
		return "Rapha\xebl\u2019s object"
	};
	au.ae = M;
	var X = function(d) {
		this.items = [];
		this[n] = 0;
		if (d) {
			for ( var e = 0, E = d[n]; e < E; e++) {
				if (d[e] && (d[e].constructor == aF || d[e].constructor == X)) {
					this[this.items[n]] = this.items[this.items[n]] = d[e];
					this[n]++
				}
			}
		}
	};
	X[a9][f] = function() {
		var R, d;
		for ( var e = 0, E = arguments[n]; e < E; e++) {
			R = arguments[e];
			if (R && (R.constructor == aF || R.constructor == X)) {
				d = this.items[n];
				this[d] = this.items[d] = R;
				this[n]++
			}
		}
		return this
	};
	X[a9].pop = function() {
		delete this[this[n]--];
		return this.items.pop()
	};
	for ( var B in aF[a9]) {
		if (aF[a9][W](B)) {
			X[a9][B] = (function(d) {
				return function() {
					for ( var e = 0, E = this.items[n]; e < E; e++) {
						this.items[e][d][a7](this.items[e], arguments)
					}
					return this
				}
			})(B)
		}
	}
	X[a9].attr = function(e, bc) {
		if (e && au.is(e, "array") && au.is(e[0], "object")) {
			for ( var d = 0, S = e[n]; d < S; d++) {
				this.items[d].attr(e[d])
			}
		} else {
			for ( var E = 0, R = this.items[n]; E < R; E++) {
				this.items[E].attr(e, bc)
			}
		}
		return this
	};
	X[a9].animate = function(S, e, be, bd) {
		(au.is(be, "function") || !be) && (bd = be || null);
		var d = this.items[n], E = d, bc = this, R;
		bd && (R = function() {
			!--d && bd.call(bc)
		});
		this.items[--E].animate(S, e, be || R, R);
		while (E--) {
			this.items[E].animateWith(this.items[d - 1], S, e, be || R, R)
		}
		return this
	};
	X[a9].insertAfter = function(e) {
		var d = this.items[n];
		while (d--) {
			this.items[d].insertAfter(e)
		}
		return this
	};
	X[a9].getBBox = function() {
		var d = [], bc = [], e = [], R = [];
		for ( var E = this.items[n]; E--;) {
			var S = this.items[E].getBBox();
			d[f](S.x);
			bc[f](S.y);
			e[f](S.x + S.width);
			R[f](S.y + S.height)
		}
		d = aR[a7](0, d);
		bc = aR[a7](0, bc);
		return {
			x : d,
			y : bc,
			width : h[a7](0, e) - d,
			height : h[a7](0, R) - bc
		}
	};
	X[a9].clone = function(E) {
		E = new X;
		for ( var d = 0, e = this.items[n]; d < e; d++) {
			E[f](this.items[d].clone())
		}
		return E
	};
	au.registerFont = function(e) {
		if (!e.face) {
			return e
		}
		this.fonts = this.fonts || {};
		var E = {
			w : e.w,
			face : {},
			glyphs : {}
		}, i = e.face["font-family"];
		for ( var bc in e.face) {
			if (e.face[W](bc)) {
				E.face[bc] = e.face[bc]
			}
		}
		if (this.fonts[i]) {
			this.fonts[i][f](E)
		} else {
			this.fonts[i] = [ E ]
		}
		if (!e.svg) {
			E.face["units-per-em"] = K(e.face["units-per-em"], 10);
			for ( var R in e.glyphs) {
				if (e.glyphs[W](R)) {
					var S = e.glyphs[R];
					E.glyphs[R] = {
						w : S.w,
						k : {},
						d : S.d && "M" + S.d[aZ](/[mlcxtrv]/g, function(bd) {
							return {
								l : "L",
								c : "C",
								x : "z",
								t : "m",
								r : "l",
								v : "c"
							}[bd] || "M"
						}) + "z"
					};
					if (S.k) {
						for ( var d in S.k) {
							if (S[W](d)) {
								E.glyphs[R].k[d] = S.k[d]
							}
						}
					}
				}
			}
		}
		return e
	};
	a4[a9].getFont = function(be, bf, e, R) {
		R = R || "normal";
		e = e || "normal";
		bf = +bf || {
			normal : 400,
			bold : 700,
			lighter : 300,
			bolder : 800
		}[bf] || 400;
		var S = au.fonts[be];
		if (!S) {
			var E = new RegExp("(^|\\s)" + be[aZ](/[^\w\d\s+!~.:_-]/g, aA)
					+ "(\\s|$)", "i");
			for ( var d in au.fonts) {
				if (au.fonts[W](d)) {
					if (E.test(d)) {
						S = au.fonts[d];
						break
					}
				}
			}
		}
		var bc;
		if (S) {
			for ( var bd = 0, bg = S[n]; bd < bg; bd++) {
				bc = S[bd];
				if (bc.face["font-weight"] == bf
						&& (bc.face["font-style"] == e || !bc.face["font-style"])
						&& bc.face["font-stretch"] == R) {
					break
				}
			}
		}
		return bc
	};
	a4[a9].print = function(R, E, d, bd, be, bn) {
		bn = bn || "middle";
		var bj = this.set(), bm = (d + aA)[C](aA), bk = 0, bg = aA, bo;
		au.is(bd, "string") && (bd = this.getFont(bd));
		if (bd) {
			bo = (be || 16) / bd.face["units-per-em"];
			var e = bd.face.bbox.split(a), bc = +e[0], bf = +e[1]
					+ (bn == "baseline" ? e[3] - e[1] + (+bd.face.descent)
							: (e[3] - e[1]) / 2);
			for ( var bi = 0, S = bm[n]; bi < S; bi++) {
				var bh = bi && bd.glyphs[bm[bi - 1]] || {}, bl = bd.glyphs[bm[bi]];
				bk += bi ? (bh.w || bd.w) + (bh.k && bh.k[bm[bi]] || 0) : 0;
				bl && bl.d && bj[f](this.path(bl.d).attr({
					fill : "#000",
					stroke : "none",
					translation : [ bk, 0 ]
				}))
			}
			bj.scale(bo, bo, bc, bf).translate(R - bc, E - bf)
		}
		return bj
	};
	var aW = /\{(\d+)\}/g;
	au.format = function(e, i) {
		var d = au.is(i, "array") ? [ 0 ][a2](i) : arguments;
		e && au.is(e, "string") && d[n] - 1 && (e = e[aZ](aW, function(R, E) {
			return d[++E] == null ? aA : d[E]
		}));
		return e || aA
	};
	au.ninja = function() {
		m.was ? (Raphael = m.is) : delete Raphael;
		return au
	};
	au.el = aF[a9];
	return au
})();