<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #map01 > #map{
        width: 400px;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script>
    let map01 ={
        map:null,
        init:function(){
            var mapContainer = document.querySelector('#map');
            var mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            // 지도 타입을 전환할 수 있는 컨트롤 생성
            var mapTypeControl = new kakao.maps.MapTypeControl();
            // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
            // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            //  마커 생성
            // 마커가 표시될 위치
            var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);
            // 마커 생성
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            // 마커가 지도 위에 표시되도록 설정
            marker.setMap(map);

            //마커에 마우스 이벤트 등록하기
            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우 생성
            var iwContent = '<img src="/img/a.jpg" style="width:80px"><div style="padding:5px;">Hello World!</div>';
            // 인포윈도우 생성
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });
            // 마우스오버 이벤트 등록 -인포윈도우를 마커위에 표시
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                infowindow.open(map, marker);
            });
            // 마우스아웃 이벤트 등록 - 인포윈도우 제거
            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            // 클릭하면 해당 사이트로 이동하도록 등록
            kakao.maps.event.addListener(marker, 'click', function() {
                location.href='http://www.nate.com';
            });


        }
    };
    $(function(){
        map01.init();
    })
</script>

<div class="col-sm-8 text-left">
    <div class="container" id="map01">
        <h3 > MAP 01 </h3>
        <div id="map"></div>
    </div>
</div>

