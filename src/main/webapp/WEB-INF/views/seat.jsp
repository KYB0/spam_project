<%@ include file="footer.jsp" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choice Table</title>
    <link rel="icon" href="https://img.icons8.com/color/48/spam-can.png" type="image/png">
	<script src="/js/jquery-3.7.0.min.js"></script>
	
   
</head>
<style>
body{
    font-family: 'Lato', sans-serif;
    background-color: white;
    color: #fff;
    box-sizing: border-box;
}

#container{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 800px;

}

.TableContainer{
    margin: 20px 0px;
}

.showcase{
    background-color: #777;
    background: rgba(0, 0, 0, 0.1);
    border-radius: 5px;
    display: flex;
    justify-content: center;
    margin: 16px 0;
    padding: 5px 10px;
}

.TableContainer select{
    margin: 10px;
    padding: 5px 15px 5px 15px;
    border-radius: 7px;
    appearance: none;
    border: 0;
}

.TableContainer select option{

   text-align: left;
}

li{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 10px;
}

.small{
    color: black;
    margin-left: 2px;
}

.showcase .seat:hover{
    cursor: default;
    scale: 1;
}

.showcase .selectedSeat:hover{
    cursor: default;
    scale: 1;
}

.seat{
    background-color: #444451;
    width: 50px;
    height: 50px;
    margin: 3px;
    border-radius: 10px;
    cursor: pointer;
}

.availableSeat{
    background-color: #444451;
    width: 50px;
    height: 50px;
    margin: 3px;
    border-radius: 10px;
    cursor: default;
}

.selectedSeatIcon{
    background-color: #6feaf6;
    width: 50px;
    height: 50px;
    margin: 3px;
    border-radius: 10px;
    cursor: default;
}

.seat:hover{
    scale: 1.2;
}

.selectedSeat:hover{
    scale: 1.2;
}

.seat:nth-of-type(2){
    margin-right: 18px;
}

.seat:nth-of-type(7){
    margin-left: 18px;
}

.occupiedSeat:nth-of-type(2){
    margin-right: 18px;
}
.occupiedSeat:nth-of-type(7){
    margin-left: 18px;
}

.selectedSeat{
    background-color: #6feaf6;
    width: 50px;
    height: 50px;
    margin: 3px;
    border-radius: 10px;
    cursor: pointer;
}

.occupiedSeat{
    background-color: black;
    width: 50px;
    height: 50px;
    margin: 3px;
    border-radius: 10px;
}

.row{
    display: flex;
}

.text{
    margin-top: 30px;
    padding: 20px;
}

#count{
    color: #6feaf6;
}

#costs{
    color: #6feaf6;
}
.myButton {
	box-shadow: 0px 10px 14px -7px #000000;
	background:linear-gradient(to bottom, #000000 5%, #000000 100%);
	background-color:#000000;
	border-radius:10px;
	border:1px solid #000000;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:14px 40px;
	text-decoration:none;
	text-shadow:0px 1px 0px #000000;
}
.myButton:hover {
	background:linear-gradient(to bottom, #000000 5%, #000000 100%);
	background-color:#000000;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
<body>
    <div id="container">
        <div class="TableContainer">
            <label for="movie">
                자리를 선택해 주세요
            </label>
        </div>
        <ul class="showcase">
            <li>
                <div class="availableSeat"></div>
                <small class="small">빈자리</small>
            </li>
            <li>
                <div class="selectedSeatIcon"></div>
                <small class="small">선택한 자리</small>
            </li>
            <li>
                <div class="occupiedSeat"></div>
                <small class="small">선택된 자리</small>
            </li>
        </ul>

        <div class="Stable">
            <div class="Ctable"></div>
            <div class="row">
                <span class="seat">1</span>
                <span class="seat">2</span>
                <span class="seat">3</span>
                <span class="seat">4</span>
                <span class="seat">5</span>
                <span class="seat">6</span>
                <span class="seat">7</span>
                <span class="seat">8</span>
            </div>

            <div class="row">
                <span class="seat">9</span>
                <span class="seat">10</span>
                <span class="seat">11</span>
                <span class="seat">12</span>
                <span class="occupiedSeat">13</span>
                <span class="occupiedSeat">14</span>
                <span class="seat">15</span>
                <span class="seat">16</span>
            </div>

            <div class="row">
                <span class="seat">17</span>
                <span class="seat">18</span>
                <span class="seat">19</span>
                <span class="seat">20</span>
                <span class="seat">21</span>
                <span class="seat">22</span>
                <span class="occupiedSeat">23</span>
                <span class="seat">24</span>
            </div>

            <div class="row">
                <span class="seat">25</span>
                <span class="seat">26</span>
                <span class="seat">27</span>
                <span class="seat">28</span>
                <span class="seat">29</span>
                <span class="seat">30</span>
                <span class="occupiedSeat">31</span>
                <span class="occupiedSeat">32</span>
            </div>

            <div class="row">
                <span class="seat">33</span>
                <span class="seat">34</span>
                <span class="seat">35</span>
                <span class="seat">36</span>
                <span class="seat">37</span>
                <span class="seat">38</span>
                <span class="seat">39</span>
                <span class="seat">40</span>
            </div>

            <div class="row">
                <span class="seat">41</span>
                <span class="occupiedSeat">42</span>
                <span class="occupiedSeat">43</span>
                <span class="seat">44</span>
                <span class="seat">45</span>
                <span class="seat">46</span>
                <span class="occupiedSeat">47</span>
                <span class="seat">48</span>
            </div>

        </div>
        <br>
        <a href="#" class="myButton">선택완료</a>
    </div>

</body>

</html>