function calendar_draw(set_date) {
	var days_arr = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

	var html = "<table border=\"0\" width=\"100%\">";
	var calendar_date, calendar_t;

	if (set_date && set_date.length >= 4) {
		if (set_date.length == 4)
			set_date += '0101';
		else if (set_date.length == 6)
			set_date += '01';
		calendar_date = set_date;
		var y = calendar_date.substring(0, 4);
		var m = calendar_date.substring(4, 6);
		var d = calendar_date.substring(6, 8);
		var s_t = new Date(y, m - 1, d);
		if (s_t.getMonth() + 1 != Number(m) || s_t.getDate() != Number(d))
			calendar_t = null;
		else
			calendar_t = new Date(y, m - 1, 1);
	}

	var t = new Date();
	var today = t.getFullYear();

	if (t.getMonth() + 1 < 10)
		today += '0' + String(t.getMonth() + 1);
	else
		today += String(t.getMonth() + 1);

	if (t.getDate() < 10)
		today += '0' + String(t.getDate());
	else
		today += String(t.getDate());

	if (!calendar_t) {
		var y = t.getFullYear();
		var m = t.getMonth();

		calendar_t = new Date(y, m, 1);
	}

	var calendar_yymm = calendar_t.getFullYear();
	calendar_yymm += (calendar_t.getMonth() + 1 < 10) ? String('0' + (calendar_t.getMonth() + 1)) : String(calendar_t.getMonth() + 1);

	var calendar_y = Number(calendar_yymm.substring(0, 4));
	var calendar_m = Number(calendar_yymm.substring(4, 6));

	var prev_m;
	if (Number(calendar_m) == 1) {
		prev_m = String(calendar_y - 1);
		prev_m += 12;
	}
	else {
		prev_m = String(calendar_y);
		prev_m += (calendar_m - 1 < 10) ? '0' + (calendar_m - 1) : calendar_m - 1;
	}
	var next_m;
	if (Number(calendar_m) == 12) {
		next_m = String(calendar_y + 1);
		next_m += '01';
	}
	else {
		next_m = String(calendar_y);
		next_m += (calendar_m + 1 < 10) ? '0' + (calendar_m + 1) : calendar_m + 1;
	}

	calendar_m = (calendar_m < 10) ? String('0' + calendar_m) : String(calendar_m);
	var prev_y = String(calendar_y - 1) + calendar_m;
	var next_y = String(calendar_y + 1) + calendar_m;

	html += "<tr height=\"17\">";
	html += "<td colspan=\"7\" width=\"100%\" align=\"center\" valign=\"center;\">";
	html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('" + prev_y + "')\">" + calendar_prev_y + "</span>&nbsp;";
	html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('" + prev_m + "')\">" + calendar_prev_m + "</span>&nbsp;";
	html += "<span style=\"cursor:pointer; font-size: 12px; margin:0px 0px 0px 10px; \">" + calendar_y + "</span>&nbsp;";
	html += "<span style=\"cursor:pointer; font-size: 12px; margin:0px 10px 0px 0px; \">" + calendar_m + "</span>&nbsp;";
	html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('" + next_m + "')\">" + calendar_next_m + "</span>&nbsp;";
	html += "<span style=\"cursor:pointer; font-size: 12px;\" onClick=\"calendar_draw('" + next_y + "')\">" + calendar_next_y + "</span>&nbsp;";
	html += "</td>";
	//html += "<td align=\"right\" valign=\"center;\"><span style=\"cursor:pointer; font-size: 12px; font-weight:bold;\" onClick=\"calendar_close(event)\">X</span></td>";
	html += "</tr>";

	html += "<tr height=\"17\">";
	html += "<td style=\"background-color:#f0f0f0; font-weight:bold; font-size:11px; text-align:center;\">일</td>";
	html += "<td style=\"background-color:#f0f0f0; font-weight:bold; font-size:11px; text-align:center;\">월</td>";
	html += "<td style=\"background-color:#f0f0f0; font-weight:bold; font-size:11px; text-align:center;\">화</td>";
	html += "<td style=\"background-color:#f0f0f0; font-weight:bold; font-size:11px; text-align:center;\">수</td>";
	html += "<td style=\"background-color:#f0f0f0; font-weight:bold; font-size:11px; text-align:center;\">목</td>";
	html += "<td style=\"background-color:#f0f0f0; font-weight:bold; font-size:11px; text-align:center;\">금</td>";
	html += "<td style=\"background-color:#f0f0f0; font-weight:bold; font-size:11px; text-align:center;\">토</td>";
	html += "</tr>";

	var week = calendar_t.getDay();
	// 빈 TD 출력
	for (var i = 0; i < week; i++) {
		html += "<td>&nbsp;</td>\n";
	}

	// 해당월의 마지막 날을 가져옴.
	if (String(calendar_t.getMonth() + 1) == '2')
		max_days = (((calendar_y % 4 == 0) && (calendar_y % 100 != 0)) || (calendar_y % 400 == 0)) ? 29 : 28;
	else
		max_days = days_arr[calendar_t.getMonth()];

	var this_date;
	for (var i = 1; i <= max_days; i++) {
		if (week > 6) {
			html += "</tr>";
			week = 0;
		}
		if (week == 0) {
			html += "<tr height=\"17\">";
		}

		this_date = calendar_yymm;
		this_date += (i <= 9) ? String('0' + i) : String(i);

		var style = "cursor:pointer; font-size:12px; text-align:center;";
		if (set_date == this_date)
			style += " text-decoration:underline;";
		if (today == this_date)
			style += " font-weight:bold;";
		if (week == 0)
			style += " color:red;";
		if (week == 6)
			style += " color:blue;";
		html += "<td style=\"" + style + "\" onClick=\"calendar_set_date('" + this_date + "');\" onmouseover=\"this.style.backgroundColor='#eeeeee';\" onmouseout=\"this.style.backgroundColor='white';\">" + i + "</td>";
		week++;
	}

	if (week < 6) {
		for (var i = week; i <= 6; i++) {
			html += "<td>&nbsp;</td>\n";
		}
		html += "</tr>";
	}
	html += "</table>";

	calendar_div.innerHTML = html;
}