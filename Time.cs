using Godot;
using System;

public partial class Time : Node
{
	public string beatTime() {
		string beats = Math.Floor((DateTime.UtcNow.AddHours(1).TimeOfDay.TotalMilliseconds / 86400d)).ToString();
		return beats;
	}
	public string beatTaiTime(){
		string beatTai = Math.Floor((DateTime.UtcNow.TimeOfDay.TotalMilliseconds / 86400d)).ToString();
		return beatTai;
	}
	public string starDate(){
		string stardate;
		DateTime current = DateTime.Now;
		float fraction = 1440 * (current.DayOfYear - 1) + 60 * current.Hour + current.Minute + (current.Second / 60);
		if (current.Year % 4 == 0 && (current.Year % 100 != 0 || current.Year % 400 == 0)) fraction = fraction / 527.04f;
		else fraction = fraction / 525.6f;
		stardate = $"{current.Year}.";
		switch (fraction) {
			case < 10:
				stardate += $"00{fraction:N0}";
				break;
			case >= 100:
				stardate += fraction.ToString("N0");
				break;
			default:
				stardate += $"0{fraction:N0}";
				break;
		}
		return stardate;
	}
}
