from fastapi import FastAPI
from fastapi.responses import FileResponse, JSONResponse, HTMLResponse





app = FastAPI()


ZIPFILE = "./fastinit"

@app.get("/compressed-fastinit")
async def get_compressed_fastinit(req):
    print(f"request from {req.client.host}:{req.client.port}")
    return FileResponse(ZIPFILE)


@app.get("/vercode/{path:path}")
async def get_vercode(path: str):
    if path == "chatgpt":
        pass  # placeholder
    elif path == "claude":
        pass  # placeholder

    return HTMLResponse("<h1>FUckyou</h1>", status_code=200)
