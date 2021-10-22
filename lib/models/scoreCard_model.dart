
import 'dart:convert';


class ScoreCardResponse {
    ScoreCardResponse({
        required this.status,
        required this.detail,
    });

    String status;
    ScoreCardRequest detail;

    factory ScoreCardResponse.fromJson(Map<String, dynamic> json) => ScoreCardResponse(
        status: json["status"],
        detail: ScoreCardRequest.fromJson(json["detail"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "detail": detail.toJson(),
    };
}

class ScoreCardRequest {
    ScoreCardRequest({
        required this.score1,
        required this.score2,
        required this.score3,
        required this.score4,
        required this.score5,
        required this.score6,
        required this.score7,
        required this.score8,
        required this.score9,
        required this.score10,
        required this.score11,
        required this.score12,
        required this.score13,
        required this.score14,
        required this.score15,
        required this.score16,
        required this.score17,
        required this.score18,
        required this.username,
        required this.play_date
    });

    String score1;
    String score2;
    String score3;
    String score4;
    String score5;
    String score6;
    String score7;
    String score8;
    String score9;
    String score10;
    String score11;
    String score12;
    String score13;
    String score14;
    String score15;
    String score16;
    String score17;
    String score18;
    String username;
    String play_date;

    factory ScoreCardRequest.fromJson(Map<String, dynamic> json) => ScoreCardRequest(
        score1: json["score_1"],
        score2: json["score_2"],
        score3: json["score_3"],
        score4: json["score_4"],
        score5: json["score_5"],
        score6: json["score_6"],
        score7: json["score_7"],
        score8: json["score_8"],
        score9: json["score_9"],
        score10: json["score_10"],
        score11: json["score_11"],
        score12: json["score_12"],
        score13: json["score_13"],
        score14: json["score_14"],
        score15: json["score_15"],
        score16: json["score_16"],
        score17: json["score_17"],
        score18: json["score_18"],
        username: json["username"],
        play_date: json["play_date"]
    );

    Map<String, dynamic> toJson() => {
        "score_1": score1,
        "score_2": score2,
        "score_3": score3,
        "score_4": score4,
        "score_5": score5,
        "score_6": score6,
        "score_7": score7,
        "score_8": score8,
        "score_9": score9,
        "score_10": score10,
        "score_11": score11,
        "score_12": score12,
        "score_13": score13,
        "score_14": score14,
        "score_15": score15,
        "score_16": score16,
        "score_17": score17,
        "score_18": score18,
        "username": username,
        "play_date": play_date,
    };
}
