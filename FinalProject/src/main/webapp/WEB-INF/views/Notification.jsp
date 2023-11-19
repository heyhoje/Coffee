<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" >
    <title>Notification</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
<style>
    .navbar{
        min-height: 80px;
    }
    .navbar-brand{
        margin:auto;
        font-size: 2.6rem;
    }
    .panel{
        padding-top:20px;
        padding-bottom: 20px;
    }
    h3{
        color:blue;
    }
    .pstyle{
        font-size:2rem;
        font-family: verdana,sans-serif;
    }




</style>
<script>
	
	
	    
    
    $(document).ready(function(){
		
        var urlEndPoint = 'http://localhost:8080/Notification';
        var eventSource = new EventSource(urlEndPoint);
        eventSource.addEventListener("latestNews", function(event){
			var articleData = JSON.parse(event.data);
			addBlock(articleData.title, articleData.text);
        })
    })
    function addBlock(title, text){
    	var a = document.createElement("article");
    	//title
    	var h = document.createElement("H3")
    	var t = document.createTextNode(title);
    	h.appendChild(t);
    	//paragraph
    	var para = document.createElement("p");
    	para.innerHTML = text;
    	a.appendChild(h);
    	a.appendChild(para);
    	document.getElementById("pack").appendChild(a);
    }
        
</script>
<body>
	<nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <div class="navbar-brand" style="font-family: 'BM HANNA Pro', sans-serif;">주문목록이 보여집니다.</div>
            </div>
        </div>
    </nav>
    <div class = "container pstyle text-center" id="pack" style="font-family: 'BM HANNA Pro', sans-serif;">
        <div class="Panel panel-primary">
            <h1>주문리스트</h1>
            <div class="box"></div>
      	</div>
    	</div>
	</body>
</html>