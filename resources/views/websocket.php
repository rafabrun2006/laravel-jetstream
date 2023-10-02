<html>

<script>

    const ws = new WebSocket('ws://localhost:1215');

    ws.onmessage = (event) => {
        document.getElementById('ul').innerHTML += ('<li>' + event.data + '</li>');
    }

</script>
<body>
    <h1>Socket</h1>

    <ul id="ul">
        
    </ul>
</body>
</html>