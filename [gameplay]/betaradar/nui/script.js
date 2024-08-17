window.addEventListener('message', function(event) {
    let data = event.data;

    if (data.action === 'openRadar') {
        document.getElementById('radar').style.display = 'block';
    } else if (data.action === 'closeRadar') {
        document.getElementById('radar').style.display = 'none';
    } else if (data.action === 'updateRadar') {
        document.getElementById('callsign').innerText = data.callsign;
        document.getElementById('squawk').innerText = data.squawk;
        document.getElementById('altitude').innerText = data.altitude;
        document.getElementById('speed').innerText = data.speed;
        document.getElementById('emergency').style.display = data.emergency ? 'block' : 'none';
    } else if (data.action === 'clearRadar') {
        document.getElementById('callsign').innerText = 'N/A';
        document.getElementById('squawk').innerText = '7700';
        document.getElementById('altitude').innerText = '0';
        document.getElementById('speed').innerText = '0';
        document.getElementById('emergency').style.display = 'none';
    }
});
