<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
<html>

<head>
	<title>Vanilla JS Calendar</title>
	
	
	<link href="/YOGI/lendplace/vanillaCalendar.css" rel="stylesheet">
	<style>
		html {
			box-sizing: border-box;
			font-size: 10px;
		}

		body {
			font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
			color: #333;
			font-size: 1.6rem;
			background-color: #FAFAFA;
			-webkit-font-smoothing: antialiased;
		}

		.logo {
			margin: 1.6rem auto;
			text-align: center;
		}

		a,
		a:visited {
			color: #0A9297;
		}

		footer {
			text-align: center;
			margin: 1.6rem 0;
		}

		h1 {
			text-align: center;
		}

		.container {
			width: 96%;
			margin: 1.6rem auto;
			max-width: 42rem;
			text-align: center;
		}

		.demo-picked {
			font-size: 1.2rem;
			text-align: center;
		}

		.demo-picked span {
			font-weight: bold;
		}
	</style>
</head>

<body>
	<div class="container">
		
		<div id="v-cal">
			<div class="vcal-header">
				<button class="vcal-btn" data-calendar-toggle="previous">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
					</svg>
				</button>

				<div class="vcal-header__label" data-calendar-label="month">
					March 2017
				</div>


				<button class="vcal-btn" data-calendar-toggle="next">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
					</svg>
				</button>
			</div>
			<div class="vcal-week">
				<span>Mon</span>
				<span>Tue</span>
				<span>Wed</span>
				<span>Thu</span>
				<span>Fri</span>
				<span>Sat</span>
				<span>Sun</span>
			</div>
			<div class="vcal-body" data-calendar-area="month"></div>
		</div>

		<p class="demo-picked">
			Date picked:
			<span data-calendar-label="picked"></span>
		</p>

   	</div>
	<script src="/YOGI/lendplace/vanillaCalendar.js" type="text/javascript"></script>
	<script>
		window.addEventListener('load', function () {
			vanillaCalendar.init({
				disablePastDays: true
			});
		})
	</script>
</body>

</html>