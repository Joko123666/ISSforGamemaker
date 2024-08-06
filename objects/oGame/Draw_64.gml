
// gpt발 대사 출력
if (global.dialogue_mode == "visual") {
    draw_visual_dialogue();
} else if (global.dialogue_mode == "balloon") {
    draw_balloon_dialogue();
}