const std = @import("std");

pub const MagicBall = struct {
    const answers = [20][]const u8{
        "It is certain.",
        "It is decidedly so.",
        "Without a doubt",
        "Yes definitely",
        "You may rely on it",
        "As I see it, yes",
        "Most likely",
        "Outlook good",
        "Yes",
        "Signs point to yes",
        "Reply hazy, try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again",
        "Don't count on it",
        "My reply is no",
        "My sources say no",
        "Outlook not so good",
        "Very doubtful",
    };

    pub fn selectAnswer() []const u8 {
        const rand = std.crypto.random;
        const idx = rand.intRangeAtMost(u32, 0, answers.len);
        return answers[idx];
    }
};
