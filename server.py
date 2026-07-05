from fastapi import FastAPI
from fastapi.responses import FileResponse, JSONResponse, HTMLResponse, Response





app = FastAPI()


ZIPFILE = "./fastinit.zip"

@app.get("/compressed-fastinit")
async def get_compressed_fastinit():
    return FileResponse(ZIPFILE)


@app.get("/vercode/{path:path}")
async def get_vercode(path: str):
    return HTMLResponse("<h1>FUckyou</h1>", status_code=200)


@app.get("/p")
async def pwsh_loader():
    with open("./invoke.ps1", "r", encoding="utf-8") as f:
        script = f.read()

    return Response(
        content=script,
        media_type="text/plain; charset=utf-8"
    )

