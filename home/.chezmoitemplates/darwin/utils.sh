function filename {
    echo "🟠 $1"
}

function group {
    echo "📦 $1"
}

function prompt {
    echo "💬 $1"
}

function pad {
    echo -n "   "
}

function action {
    echo "🚀 $1"
}

function ignored {
    echo "✨ $1"
}

function error {
    echo "🛑 $1" >&2
}
