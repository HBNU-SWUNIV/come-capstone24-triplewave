package com.capstone.delivery.domain.robot.api;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.client.WebSocketClient;
import org.springframework.web.socket.client.standard.StandardWebSocketClient;

import com.capstone.delivery.global.websocket.handler.RobotWebSocketHandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class RobotController {

	@PostMapping("/control")
	public ResponseEntity<String> controlRobot() {

		try {
			WebSocketClient client = new StandardWebSocketClient();
			WebSocketSession session = client.execute(new RobotWebSocketHandler(), "ws://192.168.64.5:9090").get();
			WebSocketMessage<String> webSocketMessage = createWebSocketMessage();
			session.sendMessage(webSocketMessage);
			return new ResponseEntity<>("Message sent to ROS system", HttpStatus.OK);
		} catch (Exception e) {
			log.error(e.getMessage());
			return new ResponseEntity<>("Failed to send message", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	private static WebSocketMessage<String> createWebSocketMessage() {
		JSONObject position = new JSONObject();
		position.put("x", -2.0);
		position.put("y", 0.5);
		position.put("z", 0.0);

		JSONObject orientation = new JSONObject();
		orientation.put("x", 0);
		orientation.put("y", 0);
		orientation.put("z", 0);
		orientation.put("w", 1);

		JSONObject pose = new JSONObject();
		pose.put("position", position);
		pose.put("orientation", orientation);

		JSONObject header = new JSONObject();
		header.put("frame_id", "map");

		JSONObject msg = new JSONObject();
		msg.put("op", "publish");
		msg.put("topic", "/move_base_simple/goal");
		msg.put("msg", new JSONObject().put("header", header).put("pose", pose));
		return new TextMessage(msg.toString());
	}
}
